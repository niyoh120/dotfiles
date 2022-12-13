# tmux

if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" && -z "$INSIDE_EMACS" && "$TERM_PROGRAM" != "vscode" ]] && ( \
  ( [ -n "$SSH_TTY" ] && [ -z "${TMUX_DISABLE_REMOTE+x}" ] ) ||
  ( [ -z "$SSH_TTY" ] && [ -n "${TMUX_ENABLE_LOCAL+x}" ] ) \
); then
  tmux new-session -As "${TMUX_DEFAULT_SESSION_NAME:-main}"
fi

# alias
alias tmconf='$EDITOR $HOME/.tmux.conf'
alias tm="tmux new-session -As ${TMUX_DEFAULT_SESSION_NAME:-main}"
alias tml='tmux list-sessions'