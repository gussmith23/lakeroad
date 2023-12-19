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

export STP_COMMIT_HASH="0510509a85b6823278211891cbb274022340fa5c"
export YICES2_COMMIT_HASH="e27cf308cffb0ecc6cc7165c10e81ca65bc303b3"
export BITWUZLA_COMMIT_HASH="b655bc0cde570258367bf8f09a113bc7b95e46e9"
export OSS_CAD_SUITE_DATE="2023-08-06"
export RACKET_FMT_COMMIT_HASH=bd44477
export YOSYS_COMMIT_HASH="70d35314dbd7521870047ed607897f22dc48cbc3"
