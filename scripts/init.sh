#!/bin/sh

NOT_ZSH_FOUND=$(which zsh)
if [ -z "${NOT_ZSH_FOUND}" ]; then
  echo "ZSH NOT FOUND"
  apt install zsh
else
  echo "ZSH FOUND"
fi
