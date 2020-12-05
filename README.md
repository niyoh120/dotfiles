# dotfiles

My persional dotfiles, managed by [dotdrop](https://github.com/deadc0de6/dotdrop).

## 安装

### 依赖

*. pyhton3.5以上, 支持pip和venv
*. git
*. bash

### 安装dotdrop

```shell
pip3 install pipx --user
pyhton3 -m pipx ensurepath
exec bash
pipx install dotdrop
```

### 检查依赖

```shell
./check.sh
```

### 安装dotfiles

```shell
git clone https://github.com/niyoh120/dotfiles ~/.dotfiles
dotdrop -c ~/.dotfiles -p $profile
exec zsh
```

## 常见错误

### '~/.tmux/plugins/tpm/tpm' returned 127

一般是因为没有安装tpm

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
