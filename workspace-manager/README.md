# workspace-manager

## Description

This tool is used to manage workspaces of a user. It is used to list, set, clear and switch between workspaces.

## Pre-requisites

You have to create a directory with the following structure:

```text
wsm_workspaces_directory
                /workspace1
                    /bin <--- this directory will be added to the PATH
                    /source-scripts <--- this directory will be sourced
                /workspace2
                    /bin
                    /source-scripts
                ...
```

## Installation

Make a symlink to the `workspace-manager.sh` file in your `PATH`:

```bash
ln -s /path/to/workspace-manager.sh /path/to/your/bin/workspace-manager
```

Place the following lines in your `.bashrc` or `.zshrc` file:

```bash
export WSM_WORKSPACES_DIRECTORY="</path/to/wsm_workspaces_directory>"
source <(workspace-manager sourcer)
source <(workspace-manager completion)
```

