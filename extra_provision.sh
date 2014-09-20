# Install software which chef does not install properly.

# Install hub command using system ruby.
# Chef embeded rake raises exceptions with the receipe.
sudo apt-get -y install rake bundler

git clone git://github.com/github/hub.git
cd hub
sudo bundle install
sudo rake install
cd ..
rm -rf hub

# Install ruby gems in rbenv. The rbenv receipe installs them as root.
gem install bundler rails travis sinatra
rbenv rehash

# Good bye
echo "Please re-login"
