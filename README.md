# cmake_external_project

This is a simple example showing how to use CMake's ExtrnalProject feature to separate
a cross-compiling build into two parts: one part that builds for the target platform,
and another part that is built on the host system. This is useful when you need to
compile tools on the host that contribute to the build, for example utilities that
are then used as source code generators.

The example builds an [app](app) that depends on a [library](lib) that has a generated
source file. The host tool [gen](gen) is responsible for generating a library source file.
The generator tool is always built for the host, even if this project is initialized with
a cross-compiling fashion (e.g., with a cross-compiling toolchain).
