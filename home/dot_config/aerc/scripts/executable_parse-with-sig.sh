#!/bin/sh

SIG="$HOME/.config/aerc/sign/work.html"
/opt/homebrew/bin/pandoc -f rtf -t html | /bin/cat - $SIG
