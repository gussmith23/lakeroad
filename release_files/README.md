# Lakeroad

Open issues here:
<https://github.com/uwsampl/lakeroad/issues/new>

Thanks for downloading a release of Lakeroad.

To install Lakeroad on your system, simply add `./bin` to your `$PATH`.

On MacOS, run the `activate` script to un-quarantine the binaries.

To run the examples, run

```sh
./run-examples.sh
```

Examples are located in `./examples/`.

To see documentation of Lakeroad's flags, run both

```sh
./bin/lakeroad --help
```

and

```sh
./deps/lakeroad/bin/lakeroad-single-solver --help
```

Note that `./bin/lakeroad` is a wrapper over the core Lakeroad binary, `lakeroad-single-solver`. To see Lakeroad's full options, please run the core Lakeroad binary with `--help`.

## Known Bugs

- An input filename with spaces may cause issues. See #436.
