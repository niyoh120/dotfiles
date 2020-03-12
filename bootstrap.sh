#!/usr/bin/env sh
set -e

[ -n "$LOCAL_SHELL_INIT" ] && echo "Shell already init!" && exit 1

echo "Check dependency..."

[ ! -x "$(command -v dotdrop)" ] && echo "dotdrop not install!" && exit 1

if [ ! -e "$HOME/.zgen" ];then
    echo "Install zgen..."
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi