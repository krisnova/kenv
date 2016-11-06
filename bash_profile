#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

# GoLang
#
# Setup $GOPATH to /go
export GOPATH=/go
export GOBIN=/go/bin
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/Users/kris/kenv/bin:$GOPATH/bin

# Emacs
export EDITOR=/usr/bin/emacs
alias emacs=/usr/local/bin/emacs

#
# kenv bin
#
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/Users/kris/kenv/bin:$GOPATH/bin:$DIR/bin
