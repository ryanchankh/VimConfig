# Vim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rm ~/.vimrc
cp ~/config/.vimrc ~/.vimrc
vim +PlugInstall


# Tmux 
rm ~/.tmux.conf
cp ./tmux.conf ~/.tmux.conf

# Aliases
rm ~/.aliases
cp ./.aliases ~/.aliases
source ~/.aliases
