# dotdrop

alias dt=dotdrop

export DOTDROP_CONFIG="{{@@ _dotdrop_cfgpath @@}}"
export DOTDROP_PROFILE="{{@@ profile @@}}"

function dt-clean() {
    if [ "$(command -v fd)" ]; then
        fd -HI '.*\.dotdropbak' "$HOME" -x rm {}
    else
        find "$HOME" -iname '*.dotdropbak' -exec rm {} \;
    fi
}

function dt-conf() {
    "$EDITOR" "{{@@ dirname( _dotdrop_cfgpath ) @@}}"
}