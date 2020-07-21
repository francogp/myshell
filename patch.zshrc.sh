#!/usr/bin/env bash
 
echo '
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
alias open='\''xdg-open'\''
alias uzshm='\''bash ~/.myzsh/update.sh && upgrade_oh_my_zsh && bash ~/.myzsh/patch.update.sh && src'\''
alias pzshm='\''cd ~/.myzsh && git pull && bash ~/.myzsh/update.sh  && bash ~/.myzsh/patch.update.sh && upgrade_oh_my_zsh && src'\''
' >> "${HOME}/.zshrc"
