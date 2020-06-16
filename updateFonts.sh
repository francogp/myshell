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
  echo "**** Configure terminal to use 'JetBrainsMono NF' font ****"
fi
