# This dotfile is managed using dotdrop

function module-conf() {
  "$EDITOR" "{{@@ _dotfile_abs_src @@}}/$1.sh"
}

function temp-conf() {
  "$EDITOR" "$LOCAL_TEMP/$1.sh"
}

function print-path(){
  sed 's/:/\n/g' <<< "$PATH"
}