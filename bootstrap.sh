#!/usr/bin/env sh
set -e

[ -n "$LOCAL_SHELL_INIT" ] && echo "shell already init!" && exit 1

echo "Check dependency..."

[ ! -x "$(command -v dotdrop)" ] && echo "dotdrop not install!" && exit 1

[ ! -x "$(command -v svn)" ] && echo "svn not install!" && exit 1

[ ! -x "$(command -v zsh)" ] && echo "zsh not install!" && exit 1