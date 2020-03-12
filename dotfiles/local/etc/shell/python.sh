# python

# pyenv
if [ -e "$HOME/.pyenv" ];then
    push_front_path "/home/niyoh/.pyenv/bin"
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
fi