#!/bin/bash

pgrep flameshot | xargs kill
nohup /Applications/flameshot.app/Contents/MacOS/flameshot >/dev/null 2>&1 &
