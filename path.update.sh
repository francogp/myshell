echo "**** Updating m... ****"
rsync -ahzc "${HOME}/.myzsh/.zshrc" "${HOME}/" || exit 100
