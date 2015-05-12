#!/bin/sh
#
# SET UP RUBY APP DEVELOPMENT ENVIRONMENT
#

#######################
# Locate fastest mirror
#######################
## Will cause broken dependencies when mirrors are not synced... So disable :/
# sudo apt-get update
# sudo apt-get install -y netselect-apt
# netselect-apt -n wheezy && sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak && sudo mv sources.list /etc/apt/

###########
## Timezone
###########
ln -fs /usr/share/zoneinfo/UTC /etc/localtime

########################
# Dependencies and tools
########################
apt-get update
apt-get -y dist-upgrade
apt-get install -y curl git vim build-essential libfontconfig tmux zsh  bison openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev ssl-cert libffi-dev libncurses5-dev libgdbm3 libgdbm-dev python-dev libqt4-dev libqtwebkit-dev libpq-dev graphviz libgtk2.0-0 libgtkmm-3.0 libnotify-dev libreadline-dev wget ca-certificates geeqie unzip gitk

########
# Nodejs
########
curl -sL https://deb.nodesource.com/setup | sudo bash -
apt-get install -y nodejs

###############
## Postgres 9.4
###############
echo 'deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main' > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get update
apt-get dist-upgrade -y
apt-get install -y postgresql-9.4 postgresql-contrib-9.4

################
## pip + thefuck
################
curl "https://bootstrap.pypa.io/get-pip.py" | python
pip install requests[security]
pip install thefuck

###############
## Locale UTF-8
###############
locale-gen en_US.UTF-8
dpkg-reconfigure -f noninteractive locales
cat > /etc/environment <<EOF
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
RACK_ENV=development
EOF

###########################
## Set zsh as default shell
###########################
chsh -s /bin/zsh vagrant

#################
## Provision user
#################
su -c "source /vagrant/ruby_user_provision.sh" vagrant
