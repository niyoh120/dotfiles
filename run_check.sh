#!/usr/bin/env sh
set -euo pipefail

function check_cmd() {
    [ ! -x "$(command -v $1)" ] && echo "$1 not found!" || true
}

check_cmd git
check_cmd git-lfs
check_cmd tmux
check_cmd fzf
check_cmd duf
check_cmd asdf
check_cmd starship
check_cmd exa
check_cmd fd
check_cmd thefuck

check_cmd nvim

check_cmd python3
check_cmd pipx
check_cmd prettyping
