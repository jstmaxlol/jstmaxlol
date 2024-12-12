#!/bin/bash
#
##
###
####
#####
######
#######
########   _     _                        _
#########  (_)___| |_ _ __ ___   __ ___  _| |
########## | / __| __| '_ ` _ \ / _` \ \/ / |
###########| \__ \ |_| | | | | | (_| |>  <|_|
##########_/ |___/\__|_| |_| |_|\__,_/_/\_(_)
#########|__/
#######
###### jstmax!'s P.I.U.S. | jstmax!'s Post Installation Utility Script Part 1/2 (piusAuto)
##### written by jstmax! (for personal use)
#### ========================================================
### [n]otes
## [n!1] i personally recommend you to run this script after freshly installing arch linux
# [n!2] if you wanna use archinstall, select minimal installation


# create working directory - 
sudo mkdir ~/.jmtemp/

## move to working dir
cd ~/.jmtemp/

### install pacman packages
sudo wget ~/.jmtemp/ https://github.com/jstmaxlol/jstmaxlol/raw/refs/heads/main/towget/jm_pkgs_list.txt
sudo pacman -Sy --noconfirm --needed - < ~/.jmtemp/jm_pkgs_list.txt

#### do! instead of gcc/g++
sudo wget -P ~/.jmtemp/ https://github.com/jstmaxlol/ecah-lib/raw/refs/heads/main/examples/do.cpp
sudo wget -P ~/.jmtemp/ https://github.com/jstmaxlol/ecah-lib/raw/main/ecah-lib.h
sudo g++ -o do ~/.jmtemp/do.cpp
sudo cp ~/.jmtemp/do /usr/bin/do
sudo chmod +x /usr/bin/do

##### make fish the default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells && chsh -s /usr/local/bin/fish

###### do fish prompt stuff
sudo wget -P ~/.config/fish/functions/ https://github.com/jstmaxlol/jstmaxlol/raw/refs/heads/main/towget/fish_prompt.fish
sudo wget -P ~/.config/fish/functions/ https://github.com/jstmaxlol/jstmaxlol/raw/refs/heads/main/towget/fish_right_prompt.fish

####### install my scheiBe from github
####### xsc
sudo wget -P ~/.jmtemp/ https://github.com/jstmaxlol/XSC/raw/main/xsc.cpp
sudo g++ -o xsc ~/.jmtemp/xsc.cpp
sudo cp ~/.jmtemp/xsc /usr/bin/xsc
sudo chmod +x /usr/bin/xsc
######## lsd
sudo wget -P ~/.jmtemp/ https://github.com/jstmaxlol/LSD/raw/main/lsd.sh
sudo cp ~/.jmtemp/lsd.sh /usr/bin/lsd
sudo chmod +x /usr/bin/lsd

######### add custom ~/.vimrc
sudo wget -P ~/ https://github.com/jstmaxlol/jstmaxlol/raw/main/.vimrc

########## install yay!
cd ~ && sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

########### final bye bye message and notif :3
echo "[n!a]     dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" ###### 1
echo "[n!aa]        dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" ##### 2
echo "[n!aaa]           dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" #### 3
echo "[n!aaaa]              dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" ### 4
echo "[n!aaaaa]                 dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" ## 5
echo "[n!aaaaaa]                    dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" # 6
echo "[n!aaaaa]                 dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" ## 5
echo "[n!aaaa]              dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" ### 4   
echo "[n!aaa]           dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" #### 3
echo "[n!aa]        dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" ##### 2
echo "[n!a]     dO nOT fORGET tO rEBOOT yOUR sYSTEM!!!!!!!!!!!" ###### 1
