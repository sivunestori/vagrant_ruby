#!/bin/bash -x

#################
# Clone oh-my-zsh
#################
if [ ! -d ~vagrant/.oh-my-zsh ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~vagrant/.oh-my-zsh
fi
# Create a new zsh configuration from the provided template
cp ~vagrant/.oh-my-zsh/templates/zshrc.zsh-template ~vagrant/.zshrc
# Change ownership of .zshrc
chown vagrant: ~vagrant/.zshrc
# Customize theme
sed -i -e 's/ZSH_THEME=".*"/ZSH_THEME="philips"/' ~vagrant/.zshrc
# add aliases
sed -i -e 's/# Example aliases/source ~\/.bash_aliases/gi' ~vagrant/.zshrc

#######
# rbenv
#######
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install 2.2.0
rbenv global 2.2.0
gem install bundler

##########
# dotfiles
##########
cp -r /vagrant/.dotfiles .
dotfiles=('zshrc' 'gemrc' 'bash_aliases')
# Hmm, reprovisioning will screw things up...
for dotfile in $dotfiles; do
  echo '#############' >> "$HOME/.$dotfile"
  echo '# Provisioned' >> "$HOME/.$dotfile"
  echo '#############' >> "$HOME/.$dotfile"
  cat .dotfiles/.$dotfile >> "$HOME/.$dotfile"
  echo '##############' >> "$HOME/.$dotfile"
  echo '# /Provisioned' >> "$HOME/.$dotfile"
  echo '##############' >> "$HOME/.$dotfile"
done

########
# Vundle
########
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#############
# Vim plugins
#############
vim +PluginInstall +qall


#################################
# Preinstall some often used gems
#################################
cp /vagrant/Gemfile .
bundle
rm Gemfile

