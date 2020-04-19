# {{@@ header() @@}}

# zinit

# init
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

# load plugins and snippets

{%@@ if LINUX_LEGACY @@%}

zinit pack="5.8" for zsh

{%@@ endif @@%}

zinit pack for ls_colors

# fzf
zplugin pack="bgn-binary+keys" for fzf

# fzf-tab require load first
zinit load Aloxaf/fzf-tab

# z.lua
export _Z_ECHO=1
zinit for skywind3000/z.lua

# some complex
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit ice from'gh-r' as'program'
zinit load sei40kr/fast-alias-tips-bin
zinit load sei40kr/zsh-fast-alias-tips

if [ "$(command -v svn)" ]; then
    # omz
    zinit svn for \
        OMZ::plugins/extract

    # prezto
    zinit svn for \
        blockf PZT::modules/helper \
        blockf PZT::modules/git \
        PZT::modules/docker \
        PZT::modules/utility
fi

zinit for \
    PZT::modules/command-not-found/init.zsh

# git extend
zinit as="null" wait="1" lucid for \
    sbin    paulirish/git-open \
    sbin    paulirish/git-recent \
    sbin    iwata/git-now \
    make="PREFIX=$ZPFX install" \
            tj/git-extras \
    sbin="bin/git-dsf;bin/diff-so-fancy" \
            zdharma/zsh-diff-so-fancy 

# completion for dotdrop
zinit snippet 'https://github.com/deadc0de6/dotdrop/blob/master/completion/_dotdrop-completion.zsh' > /dev/null 2>&1

{%@@ if not LINUX_LEGACY @@%}

zinit as="null" from='gh-r' for \
    mv='*/fd -> fd'  sbin @sharkdp/fd \
    mv='exa* -> exa' sbin ogham/exa \
    mv='*/rg* -> rg' sbin BurntSushi/ripgrep

{%@@ endif @@%}

# asdf
zinit load asdf-vm/asdf

# theme
zinit ice atload='source ~/.p10k.zsh' lucid nocd depth=1
zinit load romkatv/powerlevel10k