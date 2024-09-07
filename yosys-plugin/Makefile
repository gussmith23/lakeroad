lakeroad.so: lakeroad.cc
	$(CXX) $(shell yosys-config --cxxflags --ldflags) -shared -o $@ lakeroad.cc -lboost_filesystem

clean:
	rm -rfv *.d *.o lakeroad.so*

-include *.d
