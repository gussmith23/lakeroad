/*
 *  yosys -- Yosys Open SYnthesis Suite
 *
 *  Copyright (C) 2012  Claire Xenia Wolf <claire@yosyshq.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

#include "kernel/celltypes.h"
#include "kernel/ff.h"
#include "kernel/ffinit.h"
#include "kernel/log.h"
#include "kernel/register.h"
#include "kernel/sigtools.h"
#include <boost/algorithm/string/join.hpp>
#include <boost/filesystem.hpp>
#include <optional>
#include <cctype>
#include <cerrno>
#include <climits>
#include <filesystem>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>

USING_YOSYS_NAMESPACE PRIVATE_NAMESPACE_BEGIN

		void
		compileWithLakeroad(RTLIL::Module *module, RTLIL::Design *design)
{
	log_debug("Compiling module %s with Lakeroad.\n", module->name.c_str());

	auto f = [&](std::string key)
	{
		if (module->attributes.count(key) != 1)
			log_error("Module %s is missing attribute %s.\n", module->name.c_str(), key.c_str());
		return module->attributes[key];
	};

	auto template_ = f("\\template").decode_string();
	auto architecture = f("\\architecture").decode_string();

	// Parse pipeline_depth attribute.
	std::optional<int> pipeline_depth;
	if (module->attributes.count("\\pipeline_depth") > 1)
		log_error("Module %s has multiple pipeline_depth attributes.\n", module->name.c_str());
	if (module->attributes.count("\\pipeline_depth") == 1)
	{
		pipeline_depth = module->attributes["\\pipeline_depth"].as_int();
		if (pipeline_depth.value() < 0)
			log_error("Pipeline depth must be a non-negative integer.\n");
	}
	else
	{
		// I don't think pipeline depth should be optional.
		log_error("Module %s is missing pipeline_depth attribute.\n", module->name.c_str());
	}

	// Parse timeout attribute.
	std::optional<int> timeout;
	if (module->attributes.count("\\timeout") > 1)
		log_error("Module %s has multiple timeout attributes.\n", module->name.c_str());
	if (module->attributes.count("\\timeout") == 1)
	{
		timeout = module->attributes["\\timeout"].as_int();
		if (timeout.value() < 0)
			log_error("Timeout must be a non-negative integer.\n");
	}
	else
	{
		timeout = std::nullopt;
	}

	// Parse extra_cycles attribute.
	std::optional<int> extra_cycles;
	if (module->attributes.count("\\extra_cycles") > 1)
		log_error("Module %s has multiple extra_cycles attributes.\n", module->name.c_str());
	if (module->attributes.count("\\extra_cycles") == 1)
	{
		extra_cycles = module->attributes["\\extra_cycles"].as_int();
		if (extra_cycles.value() < 0)
			log_error("Extra cycles must be a non-negative integer.\n");
	}
	else
	{
		extra_cycles = std::nullopt;
	}

	// Initialize solvers with "bitwuzla", "stp", "yices", "cvc5" as default.
	std::vector<std::string> solvers = {"bitwuzla", "stp", "yices", "cvc5"};
	if (!(module->attributes.count("\\solvers") == 1 || module->attributes.count("\\solvers") == 0))
	{
		log_error("solvers attribute should be specified 0 or 1 times.\n");
	}
	if (module->attributes.count("\\solvers") == 1)
	{
		auto attr = module->attributes["\\solvers"].decode_string();
		if (attr.empty())
			log_error("solvers attribute is empty.\n");
		// Strip whitespace and commas from beginning and end, and split by commas.
		attr.erase(0, attr.find_first_not_of(" ,"));
		attr.erase(attr.find_last_not_of(" ,") + 1);
		// Split by commas.
		std::stringstream ss(attr);
		std::string token;
		solvers.clear();
		while (std::getline(ss, token, ','))
		{
			token.erase(0, token.find_first_not_of(" ,"));
			token.erase(token.find_last_not_of(" ,") + 1);
			if (!token.empty())
				solvers.push_back(token);
		}
		log_debug("Using solvers: %s\n", boost::algorithm::join(solvers, ", ").c_str());
	}

	auto find_attr = [&](std::string attr)
	{
		return [&, attr](IdString port)
		{
			auto w = module->wire(port);
			assert(w);
			return w->attributes.count(attr) > 0;
		};
	};

	// Clock may or may not be present.
	auto clk_port_id = std::find_if(module->ports.begin(), module->ports.end(), find_attr("\\clk"));

	std::vector<IdString> data_ports;
	std::copy_if(module->ports.begin(), module->ports.end(), std::back_inserter(data_ports), find_attr("\\data"));

	// Out should definitely be present.
	auto out_port_id = std::find_if(module->ports.begin(), module->ports.end(), find_attr("\\out"));
	assert(out_port_id != module->ports.end());

	log_debug("Template: %s\n", template_.c_str());
	log_debug("Architecture: %s\n", architecture.c_str());
	if (timeout != std::nullopt)
	{
		log_debug("Timeout: %d seconds\n", timeout.value());
	}
	else
	{
		log_debug("No timeout specified.\n");
	}
	if (pipeline_depth != std::nullopt)
	{
		log_debug("Pipeline depth: %d\n", pipeline_depth.value());
	}
	else
	{
		log_debug("No pipeline depth specified.\n");
	}
	if (clk_port_id != module->ports.end())
	{
		log_debug("Clock port: %s\n", clk_port_id->c_str());
	}
	else
	{
		log_debug("No clock port.\n");
	}

	// Prepare the input signal flags for Lakeroad.
	std::vector<std::string> input_signal_flags;
	// First, go through data ports marked with (* data *).
	for (auto port : data_ports)
	{
		input_signal_flags.push_back("--input-signal '" + port.substr(1) + ":(port " + port.substr(1) + " " + std::to_string(module->wire(port)->width) + "):" + std::to_string(module->wire(port)->width) + "'");
	}
	// Look for extra_input_signal_flags attribute.
	std::string extra_input_signal_flags = "";
	if (module->attributes.count("\\extra_input_signal_flags") == 1)
	{
		extra_input_signal_flags = module->attributes["\\extra_input_signal_flags"].decode_string();
		if (extra_input_signal_flags.empty())
			log_error("extra_input_signal_flags attribute is empty.\n");
	}
	else if (module->attributes.count("\\extra_input_signal_flags") > 1)
	{
		log_error("Module %s has multiple extra_input_signal_flags attributes.\n", module->name.c_str());
	}

	log_debug("Out port: %s\n", out_port_id->c_str());

	auto top_module_name = module->name.substr(1);
	// auto module_name = sprintf("%s_synthesized_by_lakeroad", top_module_name.c_str());

	// Who knew getting a named temporary file was so hard in C++? This isn't a
	// great solution.
	auto verilog_filename = (boost::filesystem::temp_directory_path() / boost::filesystem::unique_path("%%%%-%%%%-%%%%-%%%%.v")).native();
	auto out_verilog_filename = (boost::filesystem::temp_directory_path() / boost::filesystem::unique_path("%%%%-%%%%-%%%%-%%%%.v")).native();
	std::vector<std::string> write_verilog_args;
	write_verilog_args.push_back("write_verilog");
	write_verilog_args.push_back(verilog_filename);
	Pass::call(design, write_verilog_args);

	auto temp_module_name = top_module_name + "_temp_output_from_lakeroad";

	std::string lakeroad_cmd = "lakeroad";
	if (getenv("LAKEROAD"))
		lakeroad_cmd = std::string(getenv("LAKEROAD"));

	log_debug("Using Lakeroad command: %s\n", lakeroad_cmd.c_str());

	std::stringstream ss;
	// clang-format off
	ss << lakeroad_cmd
			<< " --verilog-module-filepath " << verilog_filename 
			<< " --top-module-name " << top_module_name
			<< " --out-filepath " << out_verilog_filename
			<< " --out-format verilog" 
			<< " --verilog-module-out-signal " << out_port_id->substr(1) << ":" << module->wire(*out_port_id)->width
			<< " --architecture " << architecture
			<< " --template " << template_
			<< " --module-name " << temp_module_name;
	if (clk_port_id != module->ports.end()){
			ss << " --clock-name " << clk_port_id->substr(1);
	}
	for (auto input_signal : input_signal_flags)
			ss << " " << input_signal << " ";
	if (!extra_input_signal_flags.empty())
	{
		ss << " " << extra_input_signal_flags << " ";
	}
	if (pipeline_depth != std::nullopt)
		ss << " --pipeline-depth " << pipeline_depth.value();
	// clang-format on

	for (auto &solver : solvers)
	{
		ss << " --" << solver << " ";
	}

	log("Executing Lakeroad:\n%s\n", ss.str().c_str());
	if (system(ss.str().c_str()) != 0)
		log_error("Lakeroad execution failed.\n");

	std::vector<std::string> read_verilog_args;
	read_verilog_args.push_back("read_verilog");
	read_verilog_args.push_back(out_verilog_filename);
	Pass::call(design, read_verilog_args);

	log("Replacing module %s with the output of Lakeroad\n", top_module_name.c_str());
	design->remove(module);
	auto new_module = design->module(RTLIL::escape_id(temp_module_name));
	if (new_module == nullptr)
		log_error("Lakeroad returned OK, but no module named %s found.\n", top_module_name.c_str());
	design->rename(new_module, RTLIL::escape_id(top_module_name));
}

struct LakeroadPass : public Pass
{
	LakeroadPass() : Pass("lakeroad", "Invoke Lakeroad for technology mapping.") {}
	void help() override
	{
		//   |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
		log("\n");
		log("    lakeroad <top-module-name> <output-signal-name> <architecture> <template>\n");
		log("             \n");
		log("\n");
		log("This pass uses Lakeroad for technology mapping of yosys's internal gate\n");
		log("library to a target architecture.\n");
		log("\n");
	}
	void execute(std::vector<std::string>, RTLIL::Design *design) override
	{
		log_header(design, "Executing Lakeroad pass (technology mapping using Lakeroad).\n");
		log_push();

		// Have to get around the reference counting that modules() does.
		std::vector<IdString> module_names;
		std::transform(design->modules().begin(), design->modules().end(), std::back_inserter(module_names),
									 [](Module *module)
									 { return module->name; });
		for (auto name : module_names)
			compileWithLakeroad(design->module(name), design);

		log_pop();
	}
} LakeroadPass;

PRIVATE_NAMESPACE_END
