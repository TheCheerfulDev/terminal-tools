# dbx - Docker Buildx Tool

dbx is a wrapper around Docker Buildx that simplifies the process of building images and managing builder instances.

## Configuration

dbx makes use of ~/.config/dbx to store configuration. Each profile is stored as a file with the same name as the
profile.

The configuration file is a CSV file with the following structure:

```
node_name;platforms;ssh_connection_string
```

Note: the `ssh_connection_string` is optional, as it's only needed for remote nodes.

A profile named `my-awesome-profile` would look like this:

FILE: ~/.config/dbx/my-awesome-profile

```
my-local-machine;linux/amd64;
my-arm64-machine;linux/arm64;ssh://user@domain.com
my-rpi-machine;linux/arm/v7;ssh://rpi
```

Note: the `ssh_connection_string` for the `my-rpi-machine` is based on a Host that is configured in the `~/.ssh/config`

## Usage

Run the following command to see the usage information:

```shell
dbx help
```