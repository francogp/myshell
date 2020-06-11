#!/usr/bin/env bash

OLD_UBUNTU=false
if hostnamectl | grep -q "18.04"; then
  echo "Old ubuntu detected, applying fixes"
  OLD_UBUNTU=true
fi

echo "**** Installing... ****"
sudo apt update && sudo apt install -y zsh rsync fonts-powerline ruby ruby-dev && sudo gem update --system && sudo gem install colorls || exit 100

# fix for old ubuntu fzf
if [ "${OLD_UBUNTU}" = true ]; then
  sudo gem update --system 3.0.6 || exit 100
  if [ ! -d "${HOME}/.fzf" ]; then
    echo "fzf not found, trying to manually installation..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf || exit 100
    "${HOME}"/.fzf/install || exit 100
  fi
else
  sudo apt install -y fzf || exit 100
fi

fc-cache -vf

cd "${HOME}" || exit 100

# removing old files
sudo rm -rf "${HOME}/.oh-my-zsh" || exit 100
read -p "***=== Type 'exit' and enter, after next prompt!. (enter to continue) ===*** " CONT
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || exit 100
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/powerlevel10k" || exit 100
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" || exit 100
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" || exit 100
rsync -ahzc "${HOME}/.myzsh/.p10k.zsh" "${HOME}/"
rsync -ahzc "${HOME}/.myzsh/.zshrc" "${HOME}/"

echo "**** Configuring... ****"
chsh -s "$(which zsh)"

echo " ==============DONE===================
**** MANUALY INSTALL THIS FONTS ON WINDOWS!!! ****
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

**** RESTART TERMINAL! ****
"
