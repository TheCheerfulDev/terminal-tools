# JDK - sdkman and jenv wrapper tool

## prerequisites

The jdk wrapper needs the following prerequisites:

* [sdkman](https://sdkman.io/) - a tool to manage multiple JDKs
* [jenv](https://www.jenv.be/) - a command line tool to help you forget how to set the JAVA_HOME environment variable
* [yank](https://github.com/mptre/yank) - a command line tool that lets you select text from the stdin

Sdkman can be installed with the following command:

```shell
curl -s "https://get.sdkman.io" | bash
```

Both jenv and yank can be installed via brew with the following command:

```shell
brew install jenv
brew install yank
```