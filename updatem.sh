# custom update by marcelo
# add at the end to .zshrc
echo '
echo "install nvm"
sudo apt install xdg-utils
echo "install nvm"
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
echo "install yarn"
sudo npm i -g yarn
' >> update.sh

echo '
alias pzshm='pzsh && bash ~/.myzsh/updatem.sh'
alias open='xdg-open'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm 
' >> "${HOME}/.zshrc"
