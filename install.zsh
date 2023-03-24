#!/bin/zsh

# Define color codes
COLOR_DEFAULT="\033[0m"
COLOR_INFO="\033[1;34m"    # blue
COLOR_WARN="\033[1;33m"    # yellow
COLOR_ERROR="\033[1;31m"   # red

# Output informational message
info() {
    echo -e "${COLOR_INFO}[INFO] $1${COLOR_DEFAULT}"
}

# Output warning message
warn() {
    echo -e "${COLOR_WARN}[WARN] $1${COLOR_DEFAULT}"
}

# Output error message
error() {
    echo -e "${COLOR_ERROR}[ERROR] $1${COLOR_DEFAULT}" >&2
}


if [[ $(uname) == "Darwin" ]]; then
    # macOS
    info "Running on mac os"
elif [[ $(uname) == "Linux" ]]; then
    info "Running on Linux"
    info "Installing dependencies"
    sudo apt install -y stow bc
    git clone --depth=1 https://github.com/mattmc3/antidote.git antidote/dot-antidote
fi

stow --verbose --target=$HOME --restow */ --dotfiles
