#!/bin/bash
#sudo echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware
  # deb-src http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" > /etc/apt/sources.list
"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
sudo git clone https://github.com/jwilm/alacritty
cd alacritty
rustup override set stable
sudo rustup override set stable
cargo build --release && sudo cp target/release/alacritty /usr/local/bin
cd ..

#SublimeText
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

rustup default 1.7.0
#Kali Repo Installs
sudo apt-get update
sudo apt-get install -y build-essential checkinstall autoconf automake autotools-dev m4 meson
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
sudo apt-get install -y libx11-dev freeglut3-dev jq arandr libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev
sudo apt-get install -y arc-theme papirus-icon-theme feh unclutter compton imagemagick python3-pip rofi
sudo apt-get install -y i3blocks i3status i3 i3-wm
sudo apt-get install -y sublime-text
sudo apt-get install -y pipx
sudo apt-get install -y gobuster onedrive oscanner smtp-user-enum snmp feroxbuster flameshot bloodhound neo4j cargo exiftool chisel
clear

#Custom Configs/Appearance Installs
echo -e "\e[41mOTICE\e[0m"
echo "Your bash/zshrc configs will be overwritten and located in the home directory with .bak."
read -s -n 1 -p "Press ANY key to continue."
sudo mv .zshrc ~/
mkdir -p ~/.config/i3 ~/.config/compton ~/.config/rofi ~/.config/alacritty ~/.config/feroxbuster ~/.wallpaper
sudo mv .rustscan.toml ~/
sudo mv .config/i3/config ~/.config/i3/config
sudo mv .config/feroxbuster/ferox-config.toml ~/.config/feroxbuster/ferox-config.toml
sudo mv .config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
sudo mv .config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
sudo mv .config/compton/compton.conf ~/.config/compton/compton.conf
sudo mv .config/rofi/config ~/.config/rofi/config
sudo mv .fehbg ~/.fehbg
sudo mv .config/i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh
sudo mv vpnbash.sh vpnserver.sh /opt/
sudo chmod +x /opt/vpn*.sh nerdfonts.sh
sudo mv wallpaper.jpg ~/.wallpaper
clear

#GitHub Tools Install
echo -e "\e[41mNOTICE\e[0m"
read -s -n 1 -p "Beginning Cargo/GitHub tool installs. Press ANY key to continue."
cargo install rustscan
sudo curl -sL https://api.github.com/repos/carlospolop/PEASS-ng/releases/latest | jq -r ".assets[].browser_download_url" >> peass
sudo curl -sL https://api.github.com/repos/DominicBreuker/pspy/releases/latest | jq -r ".assets[].browser_download_url" >> pspy
sudo curl -sL https://api.github.com/repos/ropnop/kerbrute/releases/latest | jq -r ".assets[].browser_download_url" >> kerbrute
sudo mkdir /opt/peass /opt/pspy /opt/kerbrute
sudo mv peass /opt/peass
sudo mv pspy /opt/pspy
sudo mv kerbrute /opt/kerbrute
cd /opt/peass
sudo wget -i peass
cd ..
cd /opt/pspy
sudo wget -i pspy
cd ..
cd /opt/kerbrute
sudo wget -i kerbrute
cd ..
sudo git clone https://github.com/rebootuser/LinEnum linenum
sudo git clone https://github.com/M4ximuss/Powerless powerless
sudo git clone https://github.com/ivan-sincek/php-reverse-shell.git webshells
sudo git clone https://github.com/samratashok/nishang.git nishang
sudo git clone https://github.com/itm4n/PrivescCheck.git privesccheck
sudo git clone https://github.com/stealthcopter/deepce.git docker-enum
sudo git clone https://github.com/dirkjanm/krbrelayx.git krbrelayx
sudo git clone https://github.com/Anon-Exploiter/SUID3NUM.git suidenum
sudo git clone https://github.com/commixproject/commix.git commix
sudo git clone https://github.com/micahvandeusen/gMSADumper.git gmsadumper
sudo git clone https://github.com/Flangvik/SharpCollection.git sharp
sudo git clone https://github.com/TH3xACE/SUDO_KILLER.git sudokiller
sudo git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
sudo mv zsh-autocomplete /usr/share/
sudo git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && sudo mkdir -p build && cd build && sudo meson setup ..
sudo ninja
sudo ninja install
cd ~
pip3 install pywal bloodhound
pipx install git+https://github.com/fortra/impacket.git 
pipx install donut-shellcode
pipx install bloodyAD
pipx install git+https://github.com/Pennyw0rth/NetExec

#NerdFonts Install/Reboot
echo -e "\e[41mNOTICE\e[0m"
echo "Now installing Nerd Fonts. This process can take 20-25minutes."
read -s -n 1 -p "Press ANY key to continue or Ctrl+C to Cancel and run this install at a later time."
sudo git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
sudo chmod +x install.sh
./install.sh
echo -e "\e[41mOTICE\e[0m"
echo "After the script is done a reboot will occur. On the login screen select i3 (top right corner) on the login screen. Once on the desktop use the Github readme for more information."
read -s -n 1 -p "Press ANY key to continue."
cd ..
sudo reboot
