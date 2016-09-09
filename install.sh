#!/bin/bash

# Install emacs
brew install emacs # Will install emacs24

# Install script for the repository. Basically this will just add our bin to $PATH
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "export PATH=$PATH:$DIR/bin" >> ~/.bash_profile
echo "export EDITOR=/usr/bin/emacs" >> ~/.bash_profile
echo "alias emacs=/usr/local/bin/emacs" >> ~/.bash_profile
