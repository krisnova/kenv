#!/bin/bash

# Install script for the repository. Basically this will just add our bin to $PATH

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "export PATH=$PATH:$DIR/bin" >> ~/.bash_profile
