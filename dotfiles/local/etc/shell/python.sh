# python

if [ $(command -v python3) ]; then
    python_user_base="$(python3 -c 'import site; print(site.USER_BASE + "/bin")')"
    push_front_path "$python_user_base"
fi

if [ -e "$HOME/.poetry" ]; then
    push_front_path "$HOME/.poetry/bin"
fi

