#!/usr/bin/env bash

echo "**** Installing... ****"
sudo apt update && sudo apt install -y zsh rsync fonts-powerline || exit 100;
fc-cache -vf;
sudo apt install -y fzf;
if [[ $? > 0 ]]
then
    echo "fzf not found, trying to manually installation..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || exit 100
    ~/.fzf/install || exit 100
fi

cd ${HOME};
sudo rm -rf ${HOME}/.oh-my-zsh || exit 100;
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || exit 100;
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k || exit 100;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || exit 100;
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || exit 100;
rsync -ahzc ${HOME}/.myzsh/.p10k.zsh ${HOME}/
rsync -ahzc ${HOME}/.myzsh/.zshrc ${HOME}/

echo "**** Configuring... ****"
chsh -s $(which zsh)

echo " ==============DONE===================
**** MANUALY INSTALL THIS FONTS! ****
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

**** RESTART TERMINAL! ****
";