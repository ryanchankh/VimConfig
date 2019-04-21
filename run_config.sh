## SSH SERVER CONFIGURATION
## AUTHOR: Ryan Chan
## Last Update: 2 Novmeber 2018

# Vim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rm ~/.vimrc
cp ~/dotfiles/.vimrc ~
vim +PlugInstall

# Tmux 
rm ~/.tmux.conf
cp ./.tmux.conf ~

# Aliases
rm ~/.aliases
cp ./.aliases ~
source ~/.aliases

cd ~
