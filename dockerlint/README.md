# dockerlint

## Prerequisites

The dockerlint tool requires the following prerequisites:

* [bat](https://github.com/sharkdp/bat) - a modern, colorful, and powerful replacement for `cat`
* [hadolint](https://github.com/hadolint/hadolint) - a linter for Dockerfiles

Both these tools are available in brew:

```shell
brew install bat
brew install hadolint
```

## Usage

```shell
dockerlint <dockerfile>
```

Note: if you don't provide a path to a Dockerfile, the tool will try to find the default `Dockerfile` in the current
directory.