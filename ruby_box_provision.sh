#!/bin/sh
#
# SET UP RUBY APP DEVELOPMENT ENVIRONMENT
#

##############
# Dependencies
##############
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install -y curl git vim build-essential libfontconfig tmux zsh  bison openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev ssl-cert libffi-dev libncurses5-dev libgdbm3 libgdbm-dev python-dev libqt4-dev libqtwebkit-dev libpq-dev graphviz libgtk2.0-0 libgtkmm-3.0 libnotify-dev libreadline-dev

##############
# Postgres 9.4
##############
sudo echo 'deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main' > /etc/apt/sources.list.d/pgdg.list
sudo apt-get install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install postgresql-9.4 postgresql-contrib-9.4

###############
# pip + thefuck
###############
curl "https://bootstrap.pypa.io/get-pip.py" | sudo python
sudo pip install requests[security]
sudo pip install thefuck

##########
# Timezone
##########
sudo ln -fs /usr/share/zoneinfo/UTC /etc/localtime

##############
# Locale UTF-8
##############
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure -f noninteractive locales
cat > /tmp/environment <<EOF
  LC_ALL=en_US.UTF-8
  LANG=en_US.UTF-8
EOF
sudo mv /tmp/environment /etc/environment

##########################
# Set zsh as default shell
##########################
chsh -s /bin/zsh vagrant

################
# Provision user
################
su -c "source /vagrant/ruby_user_provision.sh" vagrant
