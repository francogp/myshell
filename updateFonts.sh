#!/usr/bin/env bash
cd "${HOME}/.myzsh" || exit 100
rm -rf ".myCache"
mkdir -p ".myCache" || exit 100

if grep -iq Microsoft /proc/version; then
    echo " ==============DONE==================="
    echo "Ubuntu on Windows"       
    echo "*** Install this fonts MANUALLY ***"
    echo "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf"
    echo "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf"
else
    echo "Native Linux"

    cd ".myCache" || exit 100
    wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf  || exit 100
    wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf  || exit 100
    cd ..

    mkdir -p "${HOME}/.local/share/fonts" || exit 100
    find "${HOME}/.myzsh/.myCache/" -type f -print0 | xargs -0 mv -t "${HOME}/.local/share/fonts"
    sudo fc-cache -f -v
    echo " ==============DONE==================="
fi

echo "**** Configure terminal to use 'JetBrainsMono NF' font ****"
