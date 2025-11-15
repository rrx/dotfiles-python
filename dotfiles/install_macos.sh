#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install \
  ack\
  bat \
  bmon \
  compdef \
  coreutils \
  direnv \
  eza \
  fd \
  fnm \
  git-delta \
  htop \
  hyperfine \
  lazygit \
  lazydocker \
  neovim \
  pandoc \
  peco \
  ranger \
  ripgrep \
  starship \
  shellcheck \
  shfmt \
  the_silver_searcher \
  tmux \
  tree \
  watch \
  wget

# install meld
#brew cask install meld

# enable x11 for macos
#brew cask install xquartz

# install alacritty
#brew install --cask --no-quarantine alacritty

# better keybindings for window manager
# https://github.com/rxhanson/Rectangle
#brew cask install rectangle

# install slack via brew
#brew cask install slack

# install mcfly
#brew tap cantino/mcfly
#brew install mcfly

# install universal-ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# install gnutools
#brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep

# install cargo
#curl https://sh.rustup.rs -sSf | sh

# install fonts
cd /Library/Fonts && {
	wget https://github.com/ryanoasis/nerd-fonts/raw/2.1.0/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete.ttf
	cd -; }

