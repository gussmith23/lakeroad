# Lakeroad

Open issues here:
<https://github.com/gussmith23/lakeroad/issues/new>

Thanks for downloading a release of Lakeroad.

To install Lakeroad on your system, simply add `./bin` to your `$PATH`. Ideally, add this into your `.bashrc` or equivalent file.

```sh
export PATH="/path/to/lakeroad/bin:$PATH"
```

Lakeroad depends on Yosys, which can be installed on Mac via `brew install yosys` or on Ubuntu via `apt-get install yosys`.

On MacOS, run the `activate` script to un-quarantine the binaries.

To run the examples, run

```sh
./run-examples.sh
```

If you would like to learn how to use Lakeroad, we recommend you start by reading the example scripts in `./examples/`.


## Yosys Plugin

While you can use Lakeroad directly from the command line, we recommend using Lakeroad via Yosys. See the examples in `./examples/`, which currently serve as the documentation for using the plugin.

To use Lakeroad via Yosys, you must have the development version of Yosys installed on your system (i.e. including the Yosys header files.) This can be installed on Mac via `brew install yosys` or on Ubuntu via `apt-get install yosys-dev`. For other systems, you can quickly clone Yosys, build it, and install it to a local folder using this set of commands:

```sh
git clone --recurse-submodules https://github.com/YosysHQ/yosys.git
cd yosys
# You can change this to wherever you'd like Yosys to be installed. Just note
# that the location should be on your PATH.
INSTALL_DIR=$HOME/.local
mkdir -p $INSTALL_DIR
# Remove or change the -j argument to not build in parallel.
PREFIX=$INSTALL_DIR make -j`nproc` install
export PATH="$INSTALL_DIR/bin:$PATH"
cd ..
which yosys
which yosys-config
```

Then, you can build the Yosys plugin:

```sh
cd yosys-plugin
make
```

This should produce a Yosys plugin in the form of a shared library called `lakeroad.so` (on Linux and Mac, at least).

Yosys can now be started with the Lakeroad plugin via `yosys -m path/to/lakeroad.so`

If you get errors loading the plugin, it is likely because there are multiple versions of Yosys on your system. The plugin must be built and loaded by the same Yosys version. Ensure that the Yosys binary you are running with `-m` is the Yosys binary in the folder pointed to by `yosys-config --bindir`.

## Using Lakeroad from the Command Line

To see documentation of Lakeroad's flags, run

```sh
lakeroad --help
```

Please note that `./bin/lakeroad` is a wrapper over `./deps/lakeroad/bin/lakeroad`, which itself is a wrapper over `./deps/lakeroad/bin/lakeroad-single-solver`. The above help message will print details of the flags for all binaries.

`./deps/lakeroad/bin/lakeroad-single-solver` is the core Lakeroad binary, which runs Lakeroad using just one solver. `./deps/lakeroad/bin/lakeroad` is a wrapper which runs multiple instances of `lakeroad-single-solver`, each with a different solver. `./bin/lakeroad/` is a very thin wrapper which simply sets the `--lakeroad-executable-filepath` argument. Any of these binaries can be used directly, but we recommend using `./bin/lakeroad`.

## Known Bugs

- An input filename with spaces may cause issues. See #436.
