#!/usr/bin/env bash

# This script is used to source the workspace-manager source scripts for the active workspace.

WSM_ACTIVE_WORKSPACE_FILE="${HOME}/.config/workspace-manager/active-workspace"
WORKSPACES_DIRECTORY="/Users/mark/dev/thecheerfuldev/other/my-workspaces"

# Check if there is an active workspace
if [ ! -f "${WSM_ACTIVE_WORKSPACE_FILE}" ]; then
  return 0
fi

# Check if the active workspace exists
if [ ! -d "${WORKSPACES_DIRECTORY}/$(cat "${WSM_ACTIVE_WORKSPACE_FILE}")" ]; then
  echo "WORKSPACE-MANAGER: Active workspace does not exist"
  return 0
fi

# Set active workspace bin directory on PATH
export PATH="${WORKSPACES_DIRECTORY}/$(cat "${WSM_ACTIVE_WORKSPACE_FILE}")/bin:${PATH}"

# Loop over every file in the workspace source scripts directory
for file in "${WORKSPACES_DIRECTORY}/$(cat "${WSM_ACTIVE_WORKSPACE_FILE}")/source-scripts/"*; do
  # Check if the file is a file
  if [ -f "${file}" ]; then
    # Source the file
    source "${file}"
  fi
done
