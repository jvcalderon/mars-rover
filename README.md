# mars-rover

Mars Rover is a solution to exercise "[mars rover](./doc/EXERCISE.md)". It provides some interesting features:

* Input data in CLI is validated (planet boundaries, coordinates, commands). You can't break it.
* Wrong commands are ignored. F.ex: "MKRLX" is converted to "MRL". So you can use any command format ("M,R,L", "M R L"...)
* Interactive CLI: It asks you for new input if previous one is wrong.
* Avoids navigation outside the planet; rover can't move outside grid boundaries.
* Exposes algebraic data types and library core functions to allow reuse in different contexts (or projects). F.ex
it could be used without grid boundaries if needed.

![An example of Mars Rover CLI](./doc/render1550425874765.gif?raw=true)

## Installation

Use [Stack](https://docs.haskellstack.org/en/stable/README/) to install and run the project:

```
$ stack setup
$ stack build
```

```stack setup``` command installs an isolated environment and ```stack build``` resolves dependencies and compiles the project.

### How to run

You can use Stack to execute the generated binary:

```
$ stack exec mars-rover
```

You can execute the binary directly:

```
$ ./.stack-work/install/x86_64-osx/lts-11.10/8.2.2/bin/mars-rover
```

To interact directly to Library (avoiding CLI wrapper) you can use GHC REPL:

```
$ stack ghci --no-load
Prelude> :l src/MarsRover
```

To run the test suite:

```
$ stack test
```

## Usage

To more information about CLI usage, please read '[mars rover exercise description](./doc/EXERCISE.md)'
