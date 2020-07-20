#!/usr/bin/env bash
bash ~/.myzsh/install.sh

echo "install nvm"
sudo apt install xdg-utils
echo "install nvm"
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
echo "install yarn"
sudo npm i -g yarn
