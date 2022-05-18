# this is the big install script for linux

# versions of stuff to install
NODE_VER=16
PYTHON_VER=3.7

# github urls for creating access toekns and ssh keys
GH_TOKEN_URL="https://github.com/settings/tokens/new"
GH_SSH_URL="https://github.com/settings/ssh/new"

# just waits for user input to proceed, so the user can read the output of the scirpt
wait_to_continue () {
  echo "press any key to continue"
  read in
}

# ## # ## # ## #
# GIT

 echo \
 "this first section is going to install git, and you will have to enter your computer's password, your github username and your github email."

 wait_to_continue

#  install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# configure git
echo "\nwhat is your github username?"
read gh_username
git config --global user.name $gh_username
echo "\nwhat is your github email?"
read gh_email
git config --global user.email $gh_email
git config --global push.default simple
git config --global credential.helper cache
git config --global color.ui true
git config --global pull.rebase true
git config --global core.editor "vim"
git config --global init.defaultBranch main

# SSH and Token auth
echo "Your browser is going to open to the Github New Personal Access Token page, please create a new one with all scopes and no experiation."

wait_to_continue

xdg-open $GH_TOKEN_URL

echo "please copy and paste your token here"
read gh_token

echo $gh_token >> ght.txt

echo "The token has been saved in 'ght.txt' please enter it as your password the next time you push with https" 

# generate new ssh key and add it
# the -t flag specifies the type of key
# the -f flag specifies the path
# the -N flag specifies a passphrase, blank in this case
# the -C flag adds a comment to help identify the SSH key
ssh-keygen -t rsa -f ~/.ssh/id_rsa -N '' -C "$email"
ssh-add ~/.ssh/id_rsa

sudo apt install xclip
# use xclip to copy contents of id_rsa.pub to clipboard
xclip -selection clipboard < ~/.ssh/id_rsa.pub

echo "Your Browser is going to open to github's New SSH Key page, please paste the ssh key into a new key."

xdg-open $GH_SSH_URL

wait_to_continue

echo "Testing the ssh key"

# test ssh connection to github.com
ssh -T git@github.com

wait_to_continue

# install github cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# ## # ## # ## #
# Shell and CLI utilities

sudo dpkg --configure -a

# install curl
sudo apt install curl

# install zhell
sudo apt install zsh
# set the login shell to be zsh
# TODO: fix this -- only works with hyper.js? fine.
sudo chsh -s /bin/zsh

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install hyper.js
sudo apt install gdebi
wget -O hyper_3.0.2_amd64 https://releases.hyper.is/download/deb
sudo gdebi hyper_3.0.2_amd64
# delete the file that was installed
rm -f hyper_3.0.2_amd64
# get config file
curl -fsSL https://raw.github.com/weston-bailey/config-files/main/hyper.js > ~/.hyper.js

# install vim
sudo apt install vim
# vim package manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# get vimrc
curl -fsSL https://raw.github.com/weston-bailey/config-files/main/vimrc > ~/.vimrc

# ## # ## # ##
# Node

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# add it to zsh/bashrc
echo \
 "export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm" \
>> ~/.zshrc
# restart to re-read rc
# zsh

nvm install $NODE_VER

npm install -g nodemon gitbook

# ## # ## # ##
# GUI apps

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# VSCode
# add package repo to system
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# message to add code to path
code .

echo -e "\nif Vscode did not open, open VSCode and press CMD+Shift+P (or CTRL+Shift+P), then type 'shell command'. Click 'Install code command in PATH'."

wait_to_continue

# Clementine music player

sudo apt get install clementine

# ## # ## # ##
# Python

sudo apt-get install -y python3 python3-pip
pip3 install ipython virtualenv

# ## # ## # ##
# Postgres

# Create the file repository configuration:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
sudo apt-get update

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt-get -y install postgresql

# Auto start the postgres server
sudo -u postgres pg_ctlcluster 13 main start

# Start the postgres server the first time
sudo service postgresql start

# Create a postgres user that matches your username
sudo -u postgres createuser $USER            

# Create a postgres database that matches your username
sudo -u postgres createdb $USER           

# Start the postgres server the first time
sudo service postgresql start
     
# Run psql as the postgres user
# actually no -- do this in another tab
# sudo -u postgres psql
echo "
Please remember to open the psql shell with: 

sudo -u postgres psql 

and run the command:

ALTER USER $USER WITH SUPERUSER;
"

wait_to_continue


# ## # ## # ##
# Mongodb

sudo apt install mongodb
sudo service mongodb start

sudo mkdir -p /data/db
sudo mkdir -p /data/db
sudo chmod 777 /data/db 

# ## # ## # ##
# C lang

# gcc

# clang
sudo apt install clang --install-suggests

# cling -- TODO fix this intall
# wget https://raw.githubusercontent.com/root-project/cling/master/tools/packaging/cpt.py
# chmod +x cpt.py
# ./cpt.py --check-requirements && ./cpt.py --create-dev-env Debug --with-workdir=./cling-build/

# valgrind debugger
sudo apt-get install valgrind

# split linter
sudo apt-get -y install splint

# ## # ## #
# Audio tools

# audacity
sudo apt install audacity

# Tenacity -- no
# sudo apt purge build-essential libavcodec-dev libavformat-dev libavutil-dev libflac++-dev libglib2.0-dev libgtk-3-dev libid3tag0-dev libjack-dev liblilv-dev libmad0-dev libmp3lame-dev libogg-dev libpng-dev portaudio19-dev libportmidi-dev libserd-dev libsndfile1-dev libsord-dev libsoundtouch-dev libsoxr-dev libsuil-dev libtwolame-dev vamp-plugin-sdk libvorbis-dev lv2-dev zlib1g-dev cmake ninja-build libjpeg-dev libtiff-dev liblzma-dev libsqlite3-dev

# ubunto studio packages
sudo apt install ubuntustudio-audio ubuntustudio-audio-plugins linux-lowlatency

# ## # ## # ## # 
# optional fun apps

# signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# discord
sudo apt update
sudo apt install gdebi-core wget
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi ~/discord.deb

# spotify
 curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - \necho "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
 sudo apt-get update && sudo apt-get install spotify-client

# gzdoom
wget -O- http://debian.drdteam.org/drdteam.gpg | sudo apt-key add -\nsudo apt-add-repository 'deb http://debian.drdteam.org/ stable multiverse'\nsudo apt update\nsudo apt install gzdoom
# steam
sudo apt install steam
# dosbox staging (sdl 2 dosbox)
sudo add-apt-repository ppa:feignint/dosbox-staging\nsudo apt-get update\nsudo apt install dosbox-staging\n
# video lan
sudo apt install vlc
# keyboard to joystick mapper
sudo apt install qjoypad







