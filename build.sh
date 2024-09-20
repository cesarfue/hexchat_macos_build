#!/bin/bash

if ! $(brew list | grep -q '^xquartz$'); then
  echo "XQuartz is not installed."
  read -p "Install XQuartz? (y/n) " confirm
  if [[ $confirm == [yY] ]]; then
    echo "Installing now..."
    arch -arm64 brew install --cask xquartz
    defaults write org.macosforge.xquartz.X11 no_auth -boolean false &&
      defaults write org.macosforge.xquartz.X11 nolisten_tcp -boolean false &&
      kill $(ps -e | grep Xquartz | awk '{print $1}')
  fi
fi

xhost + ${hostname}
open -a XQuartz
make
