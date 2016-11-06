#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

brew install emacs # Will install emacs24 

EMACS_D=~/.emacs.d

cp -rv $DIR/emacs.d/* ${EMACS_D}

cd emacs.dependencies

echo "Installing All The Icons"
git clone https://github.com/domtronn/all-the-icons.el.git

echo "Installing NeoTree.."
git clone https://github.com/jaypei/emacs-neotree.git neotree

echo "Installing GoCode"
go get -u github.com/nsf/gocode

echo "*************************************************************************"
echo "Remember to Install the following Melpa Packages"
echo "*************************************************************************"
echo ""
echo "go-complete"
echo "all-the-icons"
echo "auto-complete"
echo ""
