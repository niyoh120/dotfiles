# rust

_cargo_path="$HOME/.cargo"

[ -e "$_cargo_path/env" ] && source "$_cargo_path/env"

push_back_path "$_cargo_path/bin"

# use ustc mirror
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup