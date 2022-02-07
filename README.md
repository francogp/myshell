# myshell
My SHELL configurations

## Installation 

### PowrShell v7+
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
winget install Git.Git
mkdir ~/.myshell && git clone git@github.com:francogp/myshell.git ~/.myshell && bash ~/.myshell/install.sh
```
If just using this scripts, install using:
```
winget install Git.Git
mkdir ~/.myshell && git clone https://github.com/francogp/myshell.git ~/.myshell && bash ~/.myshell/install.sh
```
## Aliases
```
uos = update OS
rshell = reinstall all from scratch
ushell = update shell configs using LOCAL modifications
pshell = pull changes and update shell configs
publicip = show public ip address
```
## Mods
Create a folder called `mods`, and place your extensions/mods there. Commits are ignored on that folder.
* If `mods/zshrc.sh` exists, that code will be injected in the main `zshrc.sh` BEFORE starship execution.
* If `mods/Microsoft.PowerShell_profile.ps1` exists, that code will be injected in the main `Microsoft.PowerShell_profile.ps1` BEFORE starship execution.
* If `mods/install.(sh|ps1)` exists, that code will be injected in the `install.(sh|ps1)` at the end.
* If `mods/update.(sh|ps1)` exists, that code will be injected in the `update.(sh|ps1)` at the end.
