#!/bin/bash

echo Install Starting …
rm -rf ~/.bash ~/.bash_profile
git clone https://github.com/xudafeng/bash.git --depth=1 ~/.bash
ln -s ~/.bash/.bash_profile ~/.bash_profile
echo Done.
