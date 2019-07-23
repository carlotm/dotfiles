#!/usr/bin/env bash

__powerline() {
    readonly OFF="$(tput sgr0)"
    readonly REV="$(tput setab 0)"
    readonly DIM="$(tput setaf 14)"

    __git_info() {
        hash git 2>/dev/null || return
        local git_eng="env LANG=C git"
        local ref=$($git_eng symbolic-ref --short HEAD 2>/dev/null)
        [[ -n "$ref" ]] || return  # not a git repo
        printf "  $ref"
    }

    function __node_info {
        if hash node 2>/dev/null; then
            local v=$(node -v)
        fi
        [ "$v" != "" ] && echo "node ${v:1}"
    }

    function __py_version {
        local v=$(pyenv version)
        echo "  python ${v%% *}"
    }

    ps1() {
        local node="$(__node_info)"
        local venv="$(__py_version)"
        local git="$(__git_info)"
        PS1="$REV$BG\r$DIM${node}${venv}${git}$OFF\n\w \$ "
    }

    PROMPT_COMMAND="ps1${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
}

__powerline
unset __powerline
