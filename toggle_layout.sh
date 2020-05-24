#!/bin/bash

layout=$(setxkbmap -query | awk '/variant/{print $2}')
case $layout in
    cmk_ed_dh)
        setxkbmap us
        ;;
    *)
        setxkbmap us cmk_ed_dh
esac
