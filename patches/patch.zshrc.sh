#!/usr/bin/env bash
 
echo '
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
alias open='\''xdg-open'\''
alias ushellm='\''bash ~/.myshell/update.sh && omz update && bash ~/.myshell/patch.update.sh && omz reload'\''
alias pshellm='\''cd ~/.myshell && git pull && bash ~/.myshell/update.sh  && bash ~/.myshell/patch.update.sh && omz update && omz reload'\''
alias cdc='\''cd ~/code'\''
' >> "${HOME}/.zshrc"
