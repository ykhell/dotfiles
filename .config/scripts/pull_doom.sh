#!/usr/bin/env sh

cd ~/projects/dotfiles/
git pull
echo "Copying Doom config..."
cp -rp ~/projects/dotfiles ~/.doom.d
echo "Copying Bash aliases..."
cp -rp ~/projects/.bash_aliases ~/.bash_aliases
