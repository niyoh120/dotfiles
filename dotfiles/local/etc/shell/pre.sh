# pre

function remove_path {
  # Delete path by parts so we can never accidentally remove sub paths
  export PATH="${PATH/:$1:/:}" # delete any instances in the middle
  export PATH="${PATH#$1:}" # delete any instance at the beginning
  export PATH="${PATH%:$1}" # delete any instance in the at the end
}

function push_front_path() {
  remove_path "$1"
  export PATH="$1:$PATH"
}

function push_back_path() {
  remove_path "$1"
  export PATH="$PATH:$1"
}

# proxy
function set_proxy() {
  export http_proxy=$1 &&
  export HTTP_PROXY=$1 &&
  export https_proxy=$1 &&
  export HTTPS_PROXY=$1 &&
  export all_proxy=$1 &&
  export ALL_PROXY=$1
}

function unset_proxy() {
  unset http_proxy &&
  unset HTTP_PROXY &&
  unset https_proxy &&
  unset HTTPS_PROXY &&
  unset all_proxy &&
  unset ALL_PROXY
}

function set-proxy() {
  set_proxy "$1"
  echo "Proxy set to $1."
}

function unset-proxy() {
  unset_proxy
  echo "Proxy unset."
}

[ "$(uname 2>/dev/null)" = "Darwin" ] && export _IS_MAC=1

[ "$(command -v tmux)" ] && source_module tmux

[ -e "$TEMP_PRE_CONF" ] && source "$TEMP_PRE_CONF"

push_front_path "/bin"
push_front_path "/usr/sbin"
push_front_path "/usr/bin"
push_front_path "/usr/local/sbin"
push_front_path "/usr/local/bin"
push_front_path "$LOCAL_BIN"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi