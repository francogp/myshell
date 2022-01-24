#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "**** Updating ... ****"
echo "* configs.."
rsync -ahzc "${HOME}/.myshell/zsh/.p10k.zsh" "${HOME}/" || exit 100
rsync -ahzc "${HOME}/.myshell/zsh/.zshrc" "${HOME}/" || exit 100
rsync -ahzc "${HOME}/.myshell/dotfiles/.nanorc" "${HOME}/" || exit 100
sudo rsync -ahzc "${HOME}/.myshell/zsh/.p10k.zsh" "/root/" || exit 100
sudo rsync -ahzc "${HOME}/.myshell/zsh/.zshrc" "/root/" || exit 100
sudo rsync -ahzc "${HOME}/.myshell/dotfiles/.nanorc" "/root/" || exit 100
mkdir -p "${HOME}/.config/neofetch/" || exit 100
sudo mkdir -p "/root/.config/neofetch/" || exit 100
rsync -ahzc "${HOME}/.myshell/dotfiles/neofetch.conf" "${HOME}/.config/neofetch/config.conf" || exit 100
sudo rsync -ahzc "${HOME}/.myshell/dotfiles/neofetch.conf" "/root/.config/neofetch/config.conf" || exit 100
echo "* autosuggestions.."
git -C ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions pull || exit 100
sudo git -C ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-autosuggestions pull
echo "* highlighting.."
git -C ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting pull || exit 100
sudo git -C ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting pull
echo "* colorsls.."
sudo gem update colorls || exit 100
echo "* zsh.."

sh -c "$(curl -fsSL https://starship.rs/install.sh)" || exit 100
cp "${SCRIPT_DIR}/starship/starship.toml" "${HOME}/.config/starship.toml" || exit 100
sudo cp "${SCRIPT_DIR}/starship/starship.toml" "/root/.config/starship.toml" || exit 100

echo "
**************************
if you manually run update.sh, RUN THIS COMMANDS!

omz update && omz reload
"
