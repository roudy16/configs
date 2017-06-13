#!/bin/bash
# Takes installed config files and moves them to directory that this script is in
# Intended for easy updating of configs git repo

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
cp "${DSTDIR}/.bashrc" "${DIR}/.bashrc"
cp "${DSTDIR}/.tmux.conf" "${DIR}/.tmux.conf"
cp "${DSTDIR}/.xinitrc" "${DIR}/.xinitrc"
cp "${DSTDIR}/.Xresources" "${DIR}/.Xresources"
cp "${DSTDIR}/.zshrc" "${DIR}/.zshrc"
cp "${NVIMDIR}/init.vim" "${DIR}/init.vim"
