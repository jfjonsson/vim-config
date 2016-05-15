set -e

if [ -d "$HOME/.vim" ]; then
  echo "\033[0;33mError:\033[0m you already have a .vim folder in $HOME. Remove it and run this script again."
  exit
fi

echo "\033[0;34mCreating folder $HOME/.vim\033[0m"
mkdir -p $HOME/.vim/undo

echo "\033[0;34mSetting up Vundle\033[0m"
hash git >/dev/null 2>&1 && env git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim || {
 echo "\033[0;33mError:\033[0m git is not installed"
 exit
}

echo "\033[0;34mFetching vim config\033[0m"
hash curl >/dev/null 2>&1 && curl -o "$HOME/.vim/vimrc" https://raw.githubusercontent.com/hlysig/vim-config/master/vimrc || {
  echo "\033[0;33mError:\033[0m curl not installed"
 exit
}

echo "\033[0;34mCreating symlink to config\033[0m"
ln ~/.vim/vimrc ~/.vimrc

echo "\033[0;34mInstallind dependencies\033[0m"
vim +PluginInstall +qall

echo "\033[0;34mDone!\033[0m"
