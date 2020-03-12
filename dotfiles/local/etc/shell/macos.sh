# macOS

# env
push_front_path "/usr/local/sbin"
push_front_path "/usr/local/bin"

export EDITOR=code

# rm
alias trm="\rm"
alias rm="rmtrash"

# replace with gnu version
alias sed="gsed"
alias grep="egrep"

# ssh locale problem
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# brew
alias brew-upgrade-all="brew upgrade && brew cask upgrade"

# llvm
push_back_path "/usr/local/opt/llvm/bin"

# go
push_back_path "/usr/local/opt/go/libexec/bin"