#!/bin/sh

SIG="$HOME/.config/aerc/sign/work.html"
/opt/homebrew/bin/pandoc -f rst -t html | /bin/cat - $SIG
