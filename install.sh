#!/bin/bash
# Copies config files from this directory to their install location

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DSTDIR="${HOME}"
NVIMDIR="${DSTDIR}/.config/nvim"

# create destination dirs if they don't exist
if [ ! -d "$DSTDIR" ]; then
    mkdir -p ${DSTDIR}/
fi
if [ ! -d "$NVIMDIR" ]; then
    mkdir -p ${NVIMDIR}/
fi

# copy config files
cp "${DIR}/.bashrc" "${DSTDIR}/.bashrc"
cp "${DIR}/.gitconfig" "${DSTDIR}/.gitconfig"
cp "${DIR}/.tmux.conf" "${DSTDIR}/.tmux.conf"
cp "${DIR}/.xinitrc" "${DSTDIR}/.xinitrc"
cp "${DIR}/.Xresources" "${DSTDIR}/.Xresources"
cp "${DIR}/.zshrc" "${DSTDIR}/.zshrc"
cp "${DIR}/init.vim" "${NVIMDIR}/init.vim"
