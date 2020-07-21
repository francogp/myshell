#!/usr/bin/env bash
bash ~/.myzsh/install.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
PATH="$HOME/bin:$HOME/.local/bin:/usr/bin:$PATH"

echo "* Install npm"
sudo apt-get install -y nodejs build-essential npm || exit 100
echo "* Install nvm"
sudo apt install xdg-utils || exit 100
echo "* Install nvm" 
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash || exit 100
echo "* Install yarn"
sudo npm i -g yarn || exit 100

echo "* Executing path update"
bash "${HOME}/.myzsh/patch.update.sh" || exit 100
echo "ending path update"
