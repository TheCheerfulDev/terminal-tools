#!/usr/bin/env bash

WSM_ROOT="${HOME}/.config/workspace-manager"
WSM_ACTIVE_WORKSPACE_FILE="${WSM_ROOT}/active-workspace"

# Check if WSM_WORKSPACES_DIRECTORY is set.
if [ -z "${WSM_WORKSPACES_DIRECTORY}" ]; then
  echo "WSM_WORKSPACES_DIRECTORY is not set"
  exit 1
fi

# Check if WSM_ROOT exists, if not, create.
if [ ! -d "${WSM_ROOT}" ]; then
  mkdir -p "${WSM_ROOT}"
fi

function completion() {
  SOURCE=${BASH_SOURCE[0]}
  while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
    SOURCE=$(readlink "$SOURCE")
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  done
  DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)

  cat ${DIR}/workspace-manager-completion.sh

  exit 0
}

function sourcer() {
  SOURCE=${BASH_SOURCE[0]}
  while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
    SOURCE=$(readlink "$SOURCE")
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  done
  DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)

  cat ${DIR}/workspace-manager-sourcer.sh

  exit 0
}

function list_workspaces() {
  echo "Workspaces:"
  for workspace in $(ls "${WSM_WORKSPACES_DIRECTORY}"); do
    echo "  ${workspace}"
  done
  exit 0
}

function active_workspace() {
  if [ ! -f "${WSM_ACTIVE_WORKSPACE_FILE}" ]; then
    echo "No active workspace"
  else
    echo "Active workspace: $(cat "${WSM_ACTIVE_WORKSPACE_FILE}")"
  fi
  exit 0
}

function activate_workspace() {
  workspace="${1}"
  if [ ! -d "${WSM_WORKSPACES_DIRECTORY}/${workspace}" ]; then
    echo "Workspace ${workspace} does not exist"
    exit 1
  fi
  echo "${workspace}" >"${WSM_ACTIVE_WORKSPACE_FILE}"
  echo "Workspace ${workspace} activated"
  echo "Run 'source ~/.zshrc' to activate the workspace in the current shell, or start a new shell."
  exit 0
}

function clear_workspace() {
  rm "${WSM_ACTIVE_WORKSPACE_FILE}"
  echo "Active workspace cleared"
  echo "Start a new shell to apply the changes."
  exit 0
}

case "$1" in
list | ls)
  list_workspaces
  ;;
ps)
  active_workspace
  ;;
activate)
  activate_workspace "$2"
  ;;
clear)
  clear_workspace
  ;;
completion)
  completion
  ;;
sourcer)
  sourcer
  ;;
*)
  echo "Usage: workspace-manager.sh <command>"
  echo ""
  echo "Commands:"
  echo "  list, ls:                 List all workspaces"
  echo "  ps:                       Show active workspace"
  echo "  activate <workspace>:     Activate the provided workspace"
  echo "  clear:                    Clear the active workspace"
  ;;
esac
