# MBT
# instructions: as root create the directory, which sh

all:
	@echo "make <version>.install"
	@echo i.e. make yosys-0.43.install

# e.g. make yosys-0.43.install
%.install:
	sudo /bin/bash -c "mkdir -p $*; chown $$USER $*; chgrp $$USER $*"
	cd $*; git clone --recurse-submodules https://github.com/YosysHQ/yosys; cd yosys; git checkout $*;
	$(MAKE) -C $*/yosys config-gcc || true
	$(MAKE) -C $*/yosys
	$(MAKE) -C $*/yosys install PREFIX=$(PWD)/$*
