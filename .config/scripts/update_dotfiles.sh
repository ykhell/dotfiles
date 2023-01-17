#!/bin/bash

# copy dot files
cp -r ~/.bashrc ~/projects/dotfiles

# directories
cp -rp  ~/.xmonad ~/projects/dotfiles
cp -rp ~/.config/xmobar ~/projects/dotfiles/.config
cp -rp ~/.config/compton ~/projects/dotfiles/.config
cp -rp ~/.config/i3 ~/projects/dotfiles/.config
cp -rp ~/.doom.d ~/projects/dotfiles
cp -rp ~/.config/alacritty ~/projects/dotfiles/.config
cp -rp ~/.config/scripts ~/projects/dotfiles/.config
