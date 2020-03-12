# zgen

source "$HOME/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save."

    # prezto options
    zgen prezto '*:*' color 'yes'
    zgen prezto 'editor' key-bindings 'emacs'
    zgen prezto 'prompt' theme 'pure'
    [ -n "$IS_MAC" ] && zgen prezto 'osx:man' dash-keyword 'manpages'

    # prezto and modules
    zgen prezto
    zgen prezto 'autosuggestions'
    zgen prezto 'syntax-highlighting'
    zgen prezto 'command-not-found'
    zgen prezto 'git'
    zgen prezto 'docker'
    zgen prezto 'tmux'

    # others
    zgen load zsh-users/zsh-completions 'src'
    zgen load caarlos0/zsh-mkc
    zgen load djui/alias-tips

    # z.lua
    export _ZL_ECHO=1
    zgen load skywind3000/z.lua 'z.lua.plugin.zsh'

    # save all to init script
    zgen save
fi