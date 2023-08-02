# run.codes Compiler - Images

This repository houses the Dockerfiles for building each language's compiling and runtime
containers. It might need some small adjustments, like language udpates and firejail insertion.

## Building

There are lots of containers, so the simpler way of executing the build process is to call the
`make all` command from the provided makefile.

## Dependencies

There is the following dependency chain over the docker images: every language depends on the `base` image (available at `base/`) and the `base` image depends on the `compiler-monitor` image (present at its own repository).

## License

For information on the license of this project, please see our [license file](LICENSE.md).

## Contributors

For information of the contributors of this project, please see our [contributors file](CONTRIBUTORS.md).

## Contributing

For information on contributing to this project, please see our [contribution guidelines](CONTRIBUTING.md).
