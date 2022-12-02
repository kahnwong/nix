#!/bin/bash

curl https://pyenv.run | bash

export PATH=$PATH:$HOME/.pyenv/bin
pyenv install -s 3.10.8
