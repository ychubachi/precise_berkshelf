# Install software which chef does not install properly.

# ---
# hub
# ---

# Install hub command using system ruby.
# Chef embeded rake raises exceptions with the receipe.
sudo apt-get -y install rake bundler

git clone git://github.com/github/hub.git
cd hub
sudo bundle install
sudo rake install
cd ..
rm -rf hub

echo $(hub alias -s) >> .bash_profile

# ---
# gem
# ---

# Setup ~/.gemrc not to create ri.
gemrc=~/.gemrc
if [ ! -f ${gemrc} ]; then
    echo "Create ${gemrc}"
    cat << EOS > ${gemrc}
gem: --no-rdoc --no-ri
EOS
fi

# Install ruby gems in rbenv. The rbenv receipe installs them as root.
gem install bundler rails travis sinatra
rbenv rehash

# Git config
git config --global push.default simple
git config --global core.editor 'emacs'

# Good bye
echo "Please re-login"
