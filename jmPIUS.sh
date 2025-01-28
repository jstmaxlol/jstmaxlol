#!/bin/bash
#
##
###
####
#####
######
#######
########        _     _                        _
#########      (_)___| |_ _ __ ___   __ ___  _| |
##########     | / __| __| '_ ` _ \ / _` \ \/ / |
###########    | \__ \ |_| | | | | | (_| |>  <|_|
##########    _/ |___/\__|_| |_| |_|\__,_/_/\_(_)
#########    |__/
#######
######       jstmax!'s PIUS | jstmax!'s Post Installation Utility Script
#####        written by jstmax! (for personal use)
####         ========================================================
###          [n]otes
##           [n!1] i personally recommend you to run this script after freshly installing arch linux
#            [n!2] if you wanna use archinstall, select minimal installation


# create working directory - 
sudo mkdir ~/.jmtemp/
echo -e "\n\n\n> creating working directory at ~/.jmtemp ..\n\n"

## move to working dir
cd ~/.jmtemp/
echo -e "\n\n\n> cding (moving) to working dir ..\n\n"

### install pacman packages
sudo pacman -Syu --noconfirm base-devel cowsay figlet lolcat curl ffmpeg fastfetch fish vim gcc gnu-free-fonts ttf-ubuntu-font-family gnupg grep noto-fonts openssh tar
echo -e "\n\n\n> installing pacman packages ..\n\n"

####
##### make fish the default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells && chsh -s /usr/local/bin/fish
echo -e "\n\n\n> setting fish as default shell ..\n\n"

###### do fish prompt stuff
sudo wget -P ~/.config/fish/functions/ https://github.com/jstmaxlol/jstmaxlol/raw/refs/heads/main/towget/fish_prompt.fish
sudo wget -P ~/.config/fish/functions/ https://github.com/jstmaxlol/jstmaxlol/raw/refs/heads/main/towget/fish_right_prompt.fish
echo -e "\n\n\n> setting fish prompts ..\n\n"

####### install some of my scheiBe from github
####### xsc
sudo wget -P ~/.jmtemp/ https://github.com/jstmaxlol/XSC/raw/main/xsc.cpp
sudo g++ -o xsc ~/.jmtemp/xsc.cpp
sudo cp ~/.jmtemp/xsc /usr/bin/xsc
sudo chmod +x /usr/bin/xsc
echo -e "\n\n\n> installing xsc ..\n\n"
########
######### add custom ~/.vimrc
sudo wget -P ~/ https://github.com/jstmaxlol/jstmaxlol/raw/main/.vimrc
echo -e "\n\n\n> adding custom ~/.vimrc ..\n\n"

########## install yay
echo -e "\n\n\n> installing yay - start..\n\n"
cd ~ && sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
echo -e "\n\n\n> installing yay - end.\n\n"

# # # # # #
echo -e "\n\n\n> deleting working dir ..\n\n"
sudo rm -rv ~/.jmtemp/
# # # # # #

#  #  #  #  #
echo -e "\n\n\n\n\n>> >> >> don't forget to quickstart your hyprland cfg with \"mylinuxforwork/hyprland-starter\" << << <<\n"
read -p "run hyprland-starter install script? (y/n): " answ
if [ $answ = 'y' ]; then
  echo -e "\n\n\n> running install script ..\n\n"
  bash <(curl -s https://raw.githubusercontent.com/mylinuxforwork/hyprland-starter/main/setup.sh)
else
  echo -e "~>> ~>> ~>> ~>> do not forget to reboot your system!! <<~ <<~ <<~ <<~"
fi
#  #  #  #  #
