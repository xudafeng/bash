#!/bin/bash
echo Install Starting …
rm -rf ~/.bash ~/.bash_profile
git clone https://github.com/xudafeng/bash.git ~/.bash
ln -s ~/.bash/.bash_profile ~/.bash_profile
echo Done.
