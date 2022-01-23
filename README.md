# myshell
My SHELL configurations

# Franco
## Installation 

### PowrShell
If using SSH, and will contribute to the project, install using:
```
cd ~ && mkdir ~/.myshell && git clone git@github.com:francogp/myshell.git .myshell && pwsh .myshell/install.ps1
```
If just using this scripts, install using:
```
cd ~ && mkdir ~/.myshell && git clone https://github.com/francogp/myshell.git .myshell && pwsh .myshell/install.ps1
```
### BASH
If using SSH, and will contribute to the project, install using:
```
mkdir ~/.myshell && git clone git@github.com:francogp/myshell.git ~/.myshell && bash ~/.myshell/install.sh
```
If just using this scripts, install using:
```
mkdir ~/.myshell && git clone https://github.com/francogp/myshell.git ~/.myshell && bash ~/.myshell/install.sh
```
## Update all scripts and plugins
for update zsh with latest LOCAL modifications, use:
```
ushell
```
To update all repositories and update local configs, you can use:
```
pshell
```
## Aliases
```
alias uos='sudo apt update && sudo apt -y upgrade && sudo apt -y autoremove'
alias ushell='bash ~/.myshell/update.sh && omz update && omz reload'
alias pshell='cd ~/.myshell && git pull && bash ~/.myshell/update.sh && omz update && omz reload'
```

# Marce
## Installation 

If using SSH, and will contribute to the project, install using:
```
git clone git@github.com:francogp/myshell.git ~/.myshell && bash ~/.myshell/patch.install.sh
```
If just using this scripts, install using:
```
git clone https://github.com/francogp/myshell.git ~/.myshell && bash ~/.myshell/patch.install.sh
```

## Update all scripts and plugins
For update zsh with latest LOCAL modifications, use:
```
ushellm
```
To update all repositories and update local configs, you can use:
```
pshellm
```
For oppen applications and files, you can use:
```
open
```

## Aliases
```
alias open='\''xdg-open'\''
alias ushellm='\''bash ~/.myshell/update.sh && omz update && bash ~/.myshell/patch.update.sh && omz reload'\''
alias pshellm='\''cd ~/.myshell && git pull && bash ~/.myshell/update.sh  && bash ~/.myshell/patch.update.sh && omz update && omz reload'\''
```
