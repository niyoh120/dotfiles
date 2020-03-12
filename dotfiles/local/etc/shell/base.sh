# function

function push_front_path {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$1:$PATH"
  esac
}

function push_back_path {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$PATH:$1";; # or PATH="$PATH:$1"
  esac
}


# proxy
function _set_proxy(){
    export http_proxy=$1 && \
    export HTTP_PROXY=$1 && \
    export https_proxy=$1 && \
    export HTTPS_PROXY=$1 && \
    export all_proxy=$1 && \
    export ALL_PROXY=$1
}

function _unset_proxy(){
    unset http_proxy && \
    unset HTTP_PROXY && \
    unset https_proxy && \
    unset HTTPS_PROXY && \
    unset all_proxy && \
    unset ALL_PROXY
}

function set-proxy(){
    _set_proxy "$1"
    echo "Proxy set to $1."
}

function unset-proxy(){
    _unset_proxy
    echo "Proxy unset."
}