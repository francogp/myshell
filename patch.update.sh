#!/usr/bin/env bash

echo "**** Updating marce settings... ****"
bash "${HOME}/.myzsh/patch.zshrc.sh" || exit 100
