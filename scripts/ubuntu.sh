#!/bin/bash

## add keys
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - #spotify
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - #postgresql
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - #brave
wget --quiet -O - https://nginx.org/keys/nginx_signing.key | sudo apt-key add - #nginx
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - #yarn
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add - #insomnia
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - #docker
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - #mssql
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add - #signal


## add repo lists
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list #spotify
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' #postgresql
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list #brave
echo "deb https://nginx.org/packages/mainline/ubuntu/ eoan nginx" | sudo tee /etc/apt/sources.list.d/nginx.list #nginx
echo "deb-src https://nginx.org/packages/mainline/ubuntu/ eoan nginx" | sudo tee /etc/apt/sources.list.d/nginx.list #nginx
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list #yarn
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee /etc/apt/sources.list.d/insomnia.list #insomnia
sudo sh -c 'echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" > /etc/apt/sources.list.d/docker.list' #docker-ce
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)" #mssql server
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list


## update and install
sudo apt-get update && 
# sudo apt-get install --yes spotify-client && installed[0]="Spotify"
# sudo apt-get install --yes postgresql-12 postgresql-client-12 && installed[1]="PostgreSQL"
# sudo apt install --yes openvpn dialog python3-pip python3-setuptools
# sudo pip3 install protonvpn-cli && installed[2]="ProtonVPN"
# sudo apt install --yes gnome-tweaks && installed[3]="GNOME Tweaks"
# sudo apt install --yes apt-transport-https curl && installed[4]="cURL"
# sudo apt install --yes jq && installed[5]="jq"
# sudo apt install --yes brave-browser && installed[6]="Brave Browser"
# sudo apt-get install --yes geary && installed[7]="Geary Email Client"
# sudo apt install --yes git && installed[8]="Git"
# sudo apt-get remove --yes nginx-common
# sudo apt-get --yes install nginx && installed[9]="nginx Web Server"
# sudo apt install --yes --no-install-recommends yarn && installed[10]="Yarn Package Manager"
# sudo apt-get install --yes php7.4 php7.4-fpm && installed[11]="PHP and PHP-FPM"
# sudo apt-get install --yes insomnia && installed[12]="Insomnia Core - REST/GraphQL Client" 
# sudo apt --fix-broken install && sudo apt install --yes openjdk-8-jre-headless openjdk-11-jre-headless openjdk-11-jdk-headless
# sudo apt install --yes gnome-clocks && installed[16]="GNOME Clocks"
# sudo apt-get install --yes transmission && installed[18]="Transmission"
# sudo apt install --yes zsh && chsh -s $(which zsh) && installed[19]="Zsh"
# sudo apt-get remove --yes docker docker-engine docker.io containerd runc
# sudo apt-get install --yes apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# sudo apt-get install --yes docker-ce docker-ce-cli containerd.io && installed[19]="Docker"
# sudo apt install --yes gnome-sushi && installed[20]="GNOME Sushi"
# sudo apt install --yes krita && installed[21]="Krita"
# sudo apt install --yes inkscape && installed[22]="Inkscape"
sudo apt-get install -y mssql-server && installed[23]="SQL Server"
sudo apt install -y signal-desktop && installed[24]="Signal"
sudo apt install -y flameshot && installed[25]="Flameshot"
sudo apt install -y remmina && installed[25]="Remmina"
sudo apt install -y tilix && installed[25]="Tilix"


# ## download .deb archives sudo apt-get remove docker docker-engine docker.io containerd runc
# cd $HOME/Downloads
# wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
# wget https://azuredatastudiobuilds.blob.core.windows.net/releases/1.16.1/azuredatastudio-linux-1.16.1.deb # https://go.microsoft.com/fwlink/?linkid=2121610
# wget https://go.skype.com/skypeforlinux-64.deb
# wget https://github.com/gohugoio/hugo/releases/download/v0.69.2/hugo_extended_0.69.2_Linux-64bit.deb
# wget https://az764295.vo.msecnd.net/stable/d69a79b73808559a91206d73d7717ff5f798f23c/code_1.45.0-1588868285_amd64.deb


# ## install .deb archives
# sudo dpkg -i dbeaver-ce_latest_amd64.deb && rm -rf dbeaver-ce_latest_amd64.deb
# sudo dpkg -i azuredatastudio-linux-1.16.1.deb && rm -rf azuredatastudio-linux-1.16.1.deb
# sudo dpkg -i skypeforlinux-64.deb && rm -rf skypeforlinux-64.deb
# sudo dpkg -i hugo_extended_0.69.2_Linux-64bit.deb && rm -rf hugo_extended_0.69.2_Linux-64bit.deb
# sudo dpkg -i code_1.45.0-1588868285_amd64.deb && rm code_1.45.0-1588868285_amd64.deb


## misc installers and other dangerous scripts from the internet that I totally trust
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - && installed[13]="Dropbox"
# wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash && installed[13]="Joplin"
# wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && installed[14]="nvm"
# cd $HOME/Downloads && git clone https://github.com/spaghettiwews/bingdesktop.git
# mkdir -p "$HOME/.bingdesktop/"
# cp --recursive $HOME/Downloads/bingdesktop/* "$HOME/.bingdesktop/" && rm -rf $HOME/Downloads/bingdesktop && installed[17]="Bing Desktop"
# sudo cp $HOME/.bingdesktop/bingdesktop.service /etc/systemd/system/ && 
# sudo systemctl daemon-reload && 
# sudo systemctl enable bingdesktop.service
# sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"


# GNOME extensions
# cd $HOME/Downloads && git clone https://github.com/kgshank/gse-sound-output-device-chooser.git
# mkdir -p "$HOME/.local/share/gnome-shell/extensions/"
# cp --recursive $HOME/Downloads/gse-sound-output-device-chooser/sound-output-device-chooser@kgshank.net "$HOME/.local/share/gnome-shell/extensions/" && rm -rf $HOME/Downloads/gse-sound-output-device-chooser && installed[15]="Output Device Selector"


## GNOME settings
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'


## messages
COLOR_GREEN=$(tput setaf 2)
COLOR_RESET=$(tput sgr0)

echo ${COLOR_GREEN}
for app in "${installed[@]}"
do
echo "✔ ${app}"
done

echo "• Remember to run sudo protonvpn init to initialise ProtonVPN"
echo "• Remember to run ~/.dropbox-dist/dropboxd to initialise Dropbox"

echo ${COLOR_RESET}

# TODO
# Composer
# VLC
# Golang
# Laravel