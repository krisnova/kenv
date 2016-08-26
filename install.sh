#!/bin/bash

# Install script for git-shortcuts

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "export PATH=$PATH:$DIR/bin" >> ~/.bash_profile
