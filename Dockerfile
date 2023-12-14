# syntax=docker/dockerfile-upstream:master-labs
# The above enables use of ADD of git repo.
FROM ubuntu:22.04

# Update, get add-apt-repository, add PPA for Racket, update again.
RUN apt update \
  &&  apt install -y software-properties-common \
  &&  add-apt-repository ppa:plt/racket \
  && apt update

## Install dependencies
# apt dependencies
RUN apt install -y \
  autoconf \
  bison \
  ccache \
  cmake \
  curl \
  flex \
  g++ \
  git \
  git \
  libfl-dev \
  libfl2 \
  libgmp-dev \
  libgoogle-perftools-dev \
  libssl-dev \
  libzmq3-dev \
  llvm-14 \
  make \
  ninja-build \
  numactl \
  openssl \
  perl \
  perl-doc \
  pkg-config \
  python3 \
  python3-pip \
  racket \
  wget \
  zlib1g \
  zlib1g-dev

# Point to llvm-config binary. Alternatively, make sure you have a binary called
# `llvm-config` on your PATH.
ENV LLVM_CONFIG=llvm-config-14

# Make a binary for `lit`. If you're on Mac, you can install lit via Brew.
# Ubuntu doesn't have a binary for it, but it is available on pip and is
# installed later in this Dockerfile.
WORKDIR /root
RUN mkdir -p /root/.local/bin \
  && echo "#!/usr/bin/env python3" >> /root/.local/bin/lit \
  && echo "from lit.main import main" >> /root/.local/bin/lit \
  && echo "if __name__ == '__main__': main()" >> /root/.local/bin/lit \
  && chmod +x /root/.local/bin/lit
ENV PATH="/root/.local/bin:${PATH}"

# Install a bunch of useful tools from prebuilt binaries. Thanks to YosysHQ for
# making this available!
#
# We currently use the following binaries from oss-cad-suite:
# yosys, verilator, cvc5, boolector.
#
# If we get an error here, we likely just need to add other branches for other
# architectures.
#
# TODO(@gussmith23): Could shrink Docker image by deleting unneeded binaries.
WORKDIR /root
RUN if [ "$(uname -m)" = "x86_64" ] ; then \
  wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2023-08-06/oss-cad-suite-linux-x64-20230806.tgz -q -O oss-cad-suite.tgz; \
  else \
  exit 1; \
  fi \
  && tar xf oss-cad-suite.tgz
ENV PATH="/root/oss-cad-suite/bin:${PATH}"

# This environment variable is needed to test with Verilator in Lakeroad.
#
# TODO(@gussmith23): I don't think this is actually needed. Verilator generates
# Makefiles that we should be using to make .a libraries to link against. Then,
# we don't have to worry about getting the right includes etc. when trying to
# compile Verilator files.
ENV VERILATOR_INCLUDE_DIR=/root/oss-cad-suite/share/verilator/include

# pip dependencies
WORKDIR /root/lakeroad
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Build Bitwuzla from version tracked in submodule.
WORKDIR /root
ARG MAKE_JOBS=2
ADD bitwuzla bitwuzla
RUN cd bitwuzla \
  && ./configure.py \
  && cd build \
  && ninja -j${MAKE_JOBS}
# Put it on the path. Note that there's a bitwuzla in oss-cad-suite, so we need
# to make sure this one takes precedence.
ENV PATH="/root/bitwuzla/build/src/main/:${PATH}"

# Install raco (Racket) dependencies. 
WORKDIR /root
ADD rosette/ rosette/
ARG FMT_COMMIT_HASH=bd44477
RUN \
  # First, fix https://github.com/racket/racket/issues/2691 by building the
  # docs.
  raco setup --doc-index --force-user-docs \
  # Install packages.
  && raco pkg install --deps search-auto --batch \
  yaml \
  # Install fmt directly from GitHub. This prevents the version from changing on
  # us unexpectedly.
  && cd /root \
  && git clone https://github.com/sorawee/fmt \
  && cd fmt \
  && git checkout ${FMT_COMMIT_HASH} \
  && raco pkg install --deps search-auto --batch \
  # Install Rosette from submodule.
  # TODO(@gussmith23): Go back to installing Rosette from package manager once
  # https://github.com/emina/rosette/pull/273 is merged.
  && cd /root/rosette \
  && raco pkg install --deps search-auto --batch

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"

ENV LAKEROAD_DIR=/root/lakeroad
ENV PYTHONPATH="${LAKEROAD_DIR}/python:${PYTHONPATH}"

# Build Rust package.
WORKDIR /root/lakeroad
ADD ./rust ./rust
RUN cargo build --manifest-path /root/lakeroad/rust/Cargo.toml

# Add other Lakeroad files. It's useful to put this as far down as possible. In
# general, only ADD files just before they're needed. This maximizes the ability
# to cache intermediate containers and minimizes rebuilding.
#
# In reality, we use the git functionality of ADD (enabled in our case via the
# optional flag --keep-git-dir) to add all of the checked-in files of the
# Lakeroad repo (but not including the .git directory itself). We could cut this
# down further if we wanted, but I think this is a clean approach for now.
WORKDIR /root/lakeroad
ADD --keep-git-dir=false . .

# Build Racket bytecode; makes Lakeroad much faster.
RUN raco make /root/lakeroad/bin/main.rkt

# Point to lakeroad-private repo. This may or may not exist, if you didn't clone
# the lakeroad-private submodule. However, it shouldn't matter, as anything that
# uses LAKEROAD_PRIVATE_DIR should check if the directory exists/is nonempty first.
ENV LAKEROAD_PRIVATE_DIR=/root/lakeroad/lakeroad-private

# Build STP.
WORKDIR /root
ENV STP_URL="https://github.com/stp/stp/archive/0510509a85b6823278211891cbb274022340fa5c.tar.gz"
RUN apt-get install -y git cmake bison flex libboost-all-dev python2 perl && \
  wget ${STP_URL} -nv -O stp.tar.gz && \
  mkdir stp && \
  tar xzf stp.tar.gz -C stp --strip-components=1 && \
  pushd stp && \
  ./scripts/deps/setup-gtest.sh && \
  ./scripts/deps/setup-outputcheck.sh && \
  ./scripts/deps/setup-cms.sh && \
  ./scripts/deps/setup-minisat.sh && \
  mkdir build && \
  pushd build && \
  cmake .. && \
  cmake --build .
ENV PATH="/root/stp/build:${PATH}"

# Build Yices2.
WORKDIR /root
ENV YICES2_URL="https://github.com/SRI-CSL/yices2/archive/e27cf308cffb0ecc6cc7165c10e81ca65bc303b3.tar.gz"
RUN apt-get install -y gperf && \
  wget ${YICES2_URL} -nv -O yices2.tar.gz && \
  mkdir yices2 && \
  tar xvf yices2.tar.gz -C yices2 --strip-components=1 && \
  pushd yices2 && \
  autoconf && \
  ./configure && \
  make && \
  # If this line fails, it's presumably because we're on a different architecture.
  [ -d build/x86_64-pc-linux-gnu-release/bin ]
ENV PATH="/root/yices2/build/x86_64-pc-linux-gnu-release/bin/:${PATH}"


WORKDIR /root/lakeroad
CMD [ "/bin/bash", "run-tests.sh" ]
