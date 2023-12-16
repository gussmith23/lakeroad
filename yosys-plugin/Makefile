lakeroad.so: lakeroad.cc
	$(CXX) $(shell yosys-config --cxxflags --ldflags) -o $@ lakeroad.cc

clean:
	rm -rfv *.d *.o lakeroad.so*

-include *.d
