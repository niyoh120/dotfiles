# comm

# env
push_front_path "$LOCAL_BIN"

if [ -z "$EDITOR" ]; then
    if [ -x "$(command -v vim)" ];then
        EDITOR="vim"
    else
        EDITOR="vi"
    fi
fi

[ -z "$VISUAL" ] && VISUAL=$EDITOR

# zsh
alias zconf='$EDITOR $HOME/.zshrc'
alias zreload='source $HOME/.zshrc'

# dotdrop
alias dotdrop='dotdrop --cfg=$HOME/.dotfiles/config.yaml'

[ -x "$(command -v curl)" ] && alias whatsmyip="curl ip.cn"

# try replace command
[ -x "$(command -v prettyping)" ] && alias ping="prettyping"

[ -x "$(command -v nvim)" ] && alias vim="nvim"

if [ -x "$(command -v exa)" ];then
    alias ls="exa"
    alias ll="exa -lh"
    alias la="exa -lha"
fi

# fzf
if [ -e "$HOME/.fzf.zsh" ]; then
    source "$HOME/.fzf.zsh"

    # --files: List files that would be searched but do not search
    # --no-ignore: Do not respect .gitignore, etc...
    # --hidden: Search hidden files and folders
    # --follow: Follow symlinks
    # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
    [ -x "$(command -v rg)" ] &&  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
fi

# vagrant
alias vg=vagrant

# tmux
alias tmuxconfig='$EDITOR $HOME/.tmux.conf'
alias tm=tmux

# fuck!
[ -x "$(command -v thefuck)" ] && eval "$(thefuck --alias)"