#!/bin/bash

xclip -o | freeze --show-line-numbers -o /tmp/freeze.png
xclip -selection clipboard -target image/png -i </tmp/freeze.png
