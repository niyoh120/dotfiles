function temp-conf() {
  "$EDITOR" "$LOCAL_TEMP/$1.sh"
}

function print-path(){
  sed 's/:/\n/g' <<< "$PATH"
}