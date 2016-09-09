#!/bin/bash

# Install emacs
brew install emacs # Will install emacs24

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "export PATH=$PATH:$DIR/bin" >> ~/.bash_profile
echo "export EDITOR=/usr/bin/emacs" >> ~/.bash_profile
echo "alias emacs=/usr/local/bin/emacs" >> ~/.bash_profile
