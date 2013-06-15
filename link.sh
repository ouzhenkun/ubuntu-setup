#!/bin/sh

SETUP=~/workspace/ubuntu-setup

ln -sf $SETUP/.bash_aliases ~/.
ln -sf $SETUP/.vimrc.local ~/.
ln -sf $SETUP/.vimrc.bundles.local ~/.
ln -sf $SETUP/.gitconfig ~/.
#ln -sf $SETUP/.proxy.ini ~/.

ln -sf $SETUP/xmonad.hs ~/.xmonad/.
ln -sf $SETUP/bin/* ~/bin/.
ln -sf $SETUP/hosts /etc/.

