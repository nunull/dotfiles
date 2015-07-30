#!/bin/bash

dir = ~/dotfiles
olddir = ~/dotfiles.old
files = "vimrc config"

mkdir -p $olddir
cd $dir

for file in $files; do
	mv ~/.$file $olddir
	ln -s $dir/$file ~/.$file
done
