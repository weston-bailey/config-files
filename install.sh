NODE_VER=16
PYTHON_VER=3.7

GH_TOKEN_URL="https://github.com/settings/tokens/new"
GH_SSH_URL="https://github.com/settings/ssh/new"

wait_to_continue () {
  echo "press any key to continue"
  read in
}

# ## # ## # ## #
# GIT

# echo \
# "this first section is going to install git, and you will have to enter your computer's password, your github username and your github email."

# wait_to_continue

# install git
# sudo add-apt-repository ppa:git-core/ppa
# sudo apt update
# sudo apt install git

# configure git
# echo "\nwhat is your github username?"
# read gh_username
# git config --global user.name $gh_username
# echo "\nwhat is your github email?"
# read gh_email
# git config --global user.email $gh_email
# git config --global push.default simple
# git config --global credential.helper cache
# git config --global color.ui true
# git config --global pull.rebase true
# git config --global core.editor "vim --wait"

# SSH and Token auth
# echo "Your browser is going to open to the Github New Personal Access Token page, please create a new one with all scopes and no experiation."

# wait_to_continue

# xdg-open $GH_TOKEN_URL

# echo "please copy and paste your token here"
# read gh_token

# echo $gh_token >> ght.txt

# echo "The token has been saved in 'ght.txt' please enter it as your password the next time you push with https" 

# generate new ssh key and add it
# the -t flag specifies the type of key
# the -f flag specifies the path
# the -N flag specifies a passphrase, blank in this case
# the -C flag adds a comment to help identify the SSH key
# ssh-keygen -t rsa -f ~/.ssh/id_rsa -N '' -C "$email"
# ssh-add ~/.ssh/id_rsa

# sudo apt install xclip
# use xclip to copy contents of id_rsa.pub to clipboard
# xclip -selection clipboard < ~/.ssh/id_rsa.pub

# echo "Your Browser is going to open to github's New SSH Key page, please paste the ssh key into a new key."

# xdg-open $GH_SSH_URL

# wait_to_continue

# echo "Testing the ssh key"

# test ssh connection to github.com
# ssh -T git@github.com

# wait_to_continue

# ## # ## # ## #
# shell and CLI utilities

# sudo dpkg --configure -a

# install curl
# sudo apt install curl

# install zhell
# sudo apt install zsh
# set the login shell to be zsh
# TODO: fix this 
# sudo chsh -s /bin/zsh

# install oh my zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install vim
# sudo apt install vim
# get vimrc
# curl -fsSL https://raw.github.com/weston-bailey/config-files/main/vimrc > ~/.vimrc

# ## # ## # ##
# Node

# install nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# add it to zsh/bashrc
# echo \
# "export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm" \
# >> ~/.zshrc
# restart to re-read rc
# zsh

# nvm install $NODE_VER

npm install -g nodemon gitbook

# ## # ## # ##
# GUI apps

# Chrome
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo dpkg -i google-chrome-stable_current_amd64.deb

# vsCode
# add package repo to system
# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
# sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# sudo apt install apt-transport-https
# sudo apt update
# sudo apt install code

# message to add code to path
# code .

# echo -e "\nif Vscode did not open, open VSCode and press CMD+Shift+P (or CTRL+Shift+P), then type 'shell command'. Click 'Install code command in PATH'.

# wait_to_continue

# ## # ## # ##
# Python

# sudo apt-get install -y python3 python3-pip
# pip3 install ipython virtualenv

# ## # ## # ##
# Postgres



# ## # ## # ##
# Mongodb

# ## # ## # ##
# C lang

# clang

# cpp

# cling















