#!/usr/bin/env bash

function __jdk2-completion() {
  local cur prev opts
  COMPREPLY=()
  JDK_CONFIG_HOME="${HOME}/.config/jdk2"
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD - 1]}"
  opts="install uninstall rm alias local global ls list ps active clear version help"

  if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]]; then
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0
  fi

  case "${prev}" in
  local | global | alias | uninstall | rm)
    COMPREPLY=($(compgen -W "$(ls -p "${JDK_CONFIG_HOME}" | grep -v /)" -- "${cur}"))
    return 0
    ;;
  *)
    return 0
    ;;
  esac
}

complete -F __jdk2-completion jdk
