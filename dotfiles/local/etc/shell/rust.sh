# rust

_cargo_path="$HOME/.cargo"

[ -e "$_cargo_path/env" ] && source "$_cargo_path/env"

# use ustc mirror
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup