#!/bin/bash
function check_cmd() {
    [ ! "$(command -v "$1")" ] && echo "$1 not found!"
}



function check_all() {
    if [ -v SHELL_SKIP_CHECK_CMD ]; then
        return
    fi
    check_cmd git
    check_cmd fzf
    check_cmd duf
    check_cmd asdf
    check_cmd starship
    check_cmd exa
    check_cmd fd
    check_cmd thefuck
    check_cmd z

    check_cmd python3
    check_cmd pip3
    check_cmd pipx
    check_cmd prettyping
}

check_all