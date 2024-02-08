# syntax=docker/dockerfile-upstream:master-labs
# The above enables use of ADD of git repo.

FROM ubuntu:22.04
ARG MAKE_JOBS=2
SHELL ["/bin/bash", "-c"] 

# Update, get add-apt-repository.
RUN apt update \
  &&  apt install -y software-properties-common

# Install apt dependencies
# `noninteractive` prevents the tzdata package from asking for a timezone on the
# command line.
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y \
  autoconf \
  bison \
  ccache \
  cmake \
  curl \
  flex \
  g++ \
  git \
  libboost-filesystem-dev \
  libfl-dev \
  libfl2 \
  libgmp-dev \
  libgoogle-perftools-dev \
  libreadline-dev \
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
  tcl \
  tcl8.6-dev \
  wget \
  zlib1g \
  zlib1g-dev

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"

# Add other Churchroad files. It's useful to put this as far down as possible.
# In general, only ADD files just before they're needed. This maximizes the
# ability to cache intermediate containers and minimizes rebuilding.
#
# In reality, we use the git functionality of ADD (enabled in our case via the
# optional flag --keep-git-dir) to add all of the checked-in files of the
# Churchroad repo (but not including the .git directory itself). We could cut
# this down further if we wanted, but I think this is a clean approach for now.
WORKDIR /root/churchroad
ADD --keep-git-dir=false . .

# Build Rust package.
WORKDIR /root/churchroad
RUN cargo build

WORKDIR /root/churchroad
CMD [ "/bin/bash", "run-tests.sh" ]
