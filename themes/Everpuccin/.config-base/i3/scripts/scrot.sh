#!/bin/sh
scrot -s -e 'xclip -selection clipboard -t image/png -i $f && rm $f'
