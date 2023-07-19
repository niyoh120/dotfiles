# git

alias g=git

# list any files flagged w/ --skip-worktree alias
alias glsskip="git ls-files -v|grep '^S'"
# add --skip-worktree flag to file
gskip() {  git update-index --skip-worktree "$@";  git status; }
# remove --skip-worktree flag from file
gunskip() {  git update-index --no-skip-worktree "$@";  git status; }