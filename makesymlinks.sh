#!/bin/bash

dir=~/dotfiles                    # dotfiles directory

files="bashrc bash_aliases vimrc gitconfig"    # list of files/folders to symlink in homedir

# change to the dotfiles directory

echo "Changing to the $dir directory"

cd $dir

echo "...done"


#  create symlinks 

for file in $files; do
	echo "Creating symlink to $file in home directory."
  rm ~/.$file
	ln -s $dir/$file ~/.$file
done
