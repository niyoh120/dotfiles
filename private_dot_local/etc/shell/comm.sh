# comm

# zsh history
export HISTSIZE="10000000"
export SAVEHIST="$HISTSIZE"
export HISTFILE="$HOME/.zsh_history"

setopt HIST_FIND_NO_DUPS

# editor
if [ -z "$EDITOR" ]; then
    if [ "$(command -v vim)" ]; then
        EDITOR="vim"
    else
        EDITOR="vi"
    fi
fi

[ -z "$VISUAL" ] && VISUAL="$EDITOR"

# alias

if [ "$(command -v exa)" ]; then
   # general use
    alias ls='exa'                                                         # ls
    alias l='exa -lbF --git'                                               # list, size, type, git
    alias ll='exa -lbGF --git'                                             # long list
    alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
    alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
    alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

    # specialty views
    alias lS='exa -1'               # one column, just names
    alias lt='exa --tree --level=2' # tree
else
    # ls, the common ones I use a lot shortened for rapid fire usage
    alias ls='ls --color=auto'
    alias l='ls -lFh'   #size,show type,human readable
    alias la='ls -lAFh' #long list,show almost all,show type,human readable
    alias lr='ls -tRFh' #sorted by date,recursive,show type,human readable
    alias lt='ls -ltFh' #long list,sorted by date,show type,human readable
    alias ll='ls -l'    #long list
    alias ldot='ls -ld .*'
    alias lS='ls -1FSsh'
    alias lart='ls -1Fcart'
    alias lrt='ls -1Fcrt'
fi

if [ "$(command -v fd)" ]; then
    export FZF_DEFAULT_COMMAND='fd --type f --color=never'
    export FZF_ALT_C_COMMAND='fd --type d . --color=never'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi


alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# zsh
function zreload() {
    echo "Reload zsh"
    exec env -i TERM=$TERM TMUX=$TMUX zsh -l
}

[ "$(command -v curl)" ] && alias whatsmyip="curl ipinfo.io"

# try replace command
[ "$(command -v prettyping)" ] && alias ping="prettyping"

[ "$(command -v nvim)" ] && alias vim="nvim"

# vagrant
[ "$(command -v vagrant)" ] && alias vagrant="vg"

# fuck
[ "$(command -v thefuck)" ] && eval "$(thefuck --alias)"

# zoxide
[ "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"