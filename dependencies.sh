#!/bin/sh
# This script exports a number of variables that help to pin the versions of
# various Lakeroad dependencies.
#
# To use, source this script before running relevant commands e.g. in a
# Dockerfile.
#
# This is just one possible way to implement dependency tracking. Some of the
# other options are:
# - No tracking at all. E.g. in the Dockerfile, we could clone STP at a specific
#   commit, using a "magic constant" commit hash. This isn't ideal, because if
#   we use STP elsewhere (e.g. in the evaluation) we have to make sure we keep
#   the commit hashes in sync.
# - Git submodules. This is very similar to what we've chosen to do, but it's
#   more directly supported by Git. For example, we used to have Bitwuzla be a
#   submodule of Lakeroad. This avoids the need to sync commit hashes as in the
#   first option. However, it's a bit overkill to add a full repository as a
#   submodule when we only need the resulting binary.
#
# This option is essentially a lighter-weight version of submodules. We track
# the commit hashes of the dependencies we need, but nothing additional is
# cloned on a `git clone --recursive`.

export STP_USER_AND_REPO="stp/stp"
export STP_COMMIT_HASH="918e55c011df5226d293d5f7a784507e03774e28"
export YICES2_COMMIT_HASH="5326f0d645df6e38ae6e7d944381d01ba7d805ab"
export BITWUZLA_COMMIT_HASH="9e5d7d82b0a0bfd3dc838eb3c3936acad500dc97"
export RACKET_FMT_COMMIT_HASH="7d0a3dfff3a6cacfb59972a56d476556f89a0b1b"
export YOSYS_COMMIT_HASH="34572708d5df970d73ca0702584ac161ca4584ae"
export CVC5_COMMIT_HASH="1d05a49387c041dba17f85f3c4e738b4b388ace2"
export VERILATOR_COMMIT_HASH="881c6ee6557fbde017466553b2f0918250e9c4bd"
