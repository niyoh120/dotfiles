# macOS

# env

export EDITOR=code
export GIT_EDITOR="code --wait"

# replace with gnu version
alias sed="gsed"
alias grep="egrep"

alias del="rmtrash"

# ssh locale problem
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# brew
alias brew-upgrade-all="brew upgrade && brew upgrade --cask && brew cu -a"

# llvm
_llvm_path="/usr/local/opt/llvm"

function enable-llvm() {
    push_front_path "$_llvm_path/bin"
    export CPPFLAGS="-I$_llvm_path/include"
    export LDFLAGS="-L$_llvm_path/lib -Wl,-rpath,$_llvm_path/lib"
}

function disable-llvm() {
    remove_path "$_llvm_path/bin"
    unset CPPFLAGS
    unset LDFLAGS
}

# go
push_back_path "/usr/local/opt/go/libexec/bin"

# gnu coreutils
_gnubin_path="/usr/local/opt/coreutils/libexec/gnubin"

function enable-gnubin(){
    push_front_path "$_gnubin_path"
}

function disable-gnubin(){
    remove_path "$_gnubin_path"
}

enable-gnubin