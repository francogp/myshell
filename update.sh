#!/usr/bin/env bash

echo "**** Updating ... ****"
echo "* configs.."
sudo locale-gen es_AR.UTF-8  
sudo update-locale LANG=es_AR.UTF-8 
rsync -ahzc "${HOME}/.myzsh/.p10k.zsh" "${HOME}/" || exit 100
rsync -ahzc "${HOME}/.myzsh/.zshrc" "${HOME}/" || exit 100
rsync -ahzc "${HOME}/.myzsh/.nanorc" "${HOME}/" || exit 100
sudo rsync -ahzc "${HOME}/.myzsh/.nanorc" "/root/" || exit 100
mkdir -p "${HOME}/.config/neofetch/" || exit 100
rsync -ahzc "${HOME}/.myzsh/neofetch.conf" "${HOME}/.config/neofetch/config.conf" || exit 100
echo "* powerlevel10k.."
git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k pull || exit 100
echo "* autosuggestions.."
git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions pull || exit 100
echo "* highlighting.."
git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting pull || exit 100
echo "* colorsls.."
sudo gem update colorls || exit 100
echo "* zsh.."

echo "
**************************
if you manually run update.sh, RUN THIS COMMANDS!

omz update && omz reload
"
