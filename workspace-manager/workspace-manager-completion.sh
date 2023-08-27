#!/usr/bin/env bash

function __workspace-manager-completion() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD - 1]}"
  opts="list ls ps activate clear"

  if [[ ${COMP_CWORD} -eq 1 ]]; then
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0
  fi

  case "${prev}" in
  activate)
    COMPREPLY=($(compgen -W "$(ls "${WSM_WORKSPACES_DIRECTORY}")" -- "${cur}"))
    return 0
    ;;
  *)
    return 0
    ;;
  esac
}

complete -F __workspace-manager-completion workspace-manager
