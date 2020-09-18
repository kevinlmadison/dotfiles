sudo apt install -y curl git vim zsh
sudo apt install cmake
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install ripgrep
cargo install exa
mkdir repos
git clone https://github.com/kevinlmadison/dotfiles ~/repos/
sudo apt install powerline fonts-powerline
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sudo ln -s ~/repos/dotfiles/.zshrc ~/.zshrc
sudo ln -s ~/repos/dotfiles/.vimrc ~/.vimrc
sudo ln -s ~/repos/dotfiles/.Xmodmap ~/.Xmodmap
sudo ln -s ~/repos/dotfiles/.Xresources_gruvbox ~/.Xresources_gruvbox
sudo ln -s ~/repos/dotfiles/.Xresources_nord ~/.Xresources_nord
sudo ln -s ~/repos/dotfiles/.fonts ~/.fonts
sudo ln -s ~/repos/dotfiles/.scripts ~/.scripts
sudo ln -s ~/repos/dotfiles/.fehbg ~/.fehbg
chmod +x ~/repos/dotfiles/.fehbg
chmod +x ~/repos/dotfiles/.scripts/touchpad_toggle
sudo apt install i3 i3blocks feh
rm -rf ~/.config/i3
sudo ln -s ~/repos/dotfiles/i3 ~/.config/i3
fc-cache -f -v
sudo apt install rxvt-unicode
chsh -s /bin/zsh

# setup neovim
sudo apt install neovim
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install -y alacritty
echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after' >> ~/.config/nvim/init.vim
echo 'let &packpath = &runtimepath' >> ~/.config/nvim/init.vim
echo 'source ~/.vimrc' >> ~/.config/nvim/init.vim

# install vim plugins
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo apt install fonts-font-awesome

# fix touchpad 
sudo apt install xserver-xorg-core
sudo apt install xserver-xorg-input-synaptics
sudo apt install xserver-xorg-input-all

# install Iosevka font
