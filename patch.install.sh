#!/usr/bin/env bash
bash ~/.myzsh/install.sh

echo "install nvm"
sudo apt install xdg-utils || exit 100
echo "install nvm" 
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash || exit 100
echo "install yarn"
sudo npm i -g yarn || exit 100

echo "executing path update"
bash "${HOME}/.myzsh/patch.update.sh" || exit 100
echo "ending path update"
