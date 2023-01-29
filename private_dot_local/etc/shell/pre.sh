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

function get-os-name() {
  OSName="$(uname 2>/dev/null)"
  echo "${OSName:l}"
}

[ -e "$TEMP_PRE_CONF" ] && source "$TEMP_PRE_CONF"

push_front_path "/usr/local/sbin"
push_front_path "/usr/local/bin"
push_front_path "$LOCAL_BIN"

[ "$(command -v tmux)" ] && source_module tmux