#!/bin/bash

mkdir -p ~/.config
mkdir -p ~/.local/share/nvim

source=$(
    cd "${BASH_SOURCE[0]%/*}"
    pwd
)

[[ "${source}" == ~/.config/nvim ]] || ln -sfn "${source}" ~/.config/nvim

plug_ref='0a255ee62da085a01ab376fd69a97e0e26df4da0'

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/${plug_ref}/plug.vim

nvim -u ~/.config/nvim/plugged.vim +PlugInstall +qall
