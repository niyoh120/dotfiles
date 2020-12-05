#!/usr/bin/env sh
set -e

echo "Check essential dependency..."

[ ! -x "$(command -v dotdrop)" ] && echo "dotdrop not found!"

[ ! -x "$(command -v svn)" ] && echo "svn not found!"

[ ! -x "$(command -v zsh)" ] && echo "zsh not found!"


echo "Check essential dependency done."

echo "Check optional dependency..."

[ ! -x "$(command -v tmux)"] && echo "tmux not found"

echo "Check optional dependency done"
