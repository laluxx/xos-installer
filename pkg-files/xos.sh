#! /bin/bash
echo -nE "
 
 █▀▀ █░░█ █▀▀ █░█ █░░ █▀▀ █▀▀ █▀▀ 
 ▀▀█ █░░█ █░░ █▀▄ █░░ █▀▀ ▀▀█ ▀▀█ 
 ▀▀▀  ▀▀▀ ▀▀▀ ▀ ▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀
"

mkdir ~/.config/suckless


echo -nE "
 
 █▀▀▄ █░░░█ █▀▄▀█ 
 █░░█ █▄█▄█ █░▀░█ 
 ▀▀▀░ ░▀░▀░ ▀░░░▀
"

wget https://dl.suckless.org/dwm/dwm-6.4.tar.gz
tar -xzvf dwm-6.4.tar.gz
cd dwm-6.4/
sudo make clean install
cd ..
mv dwm-6.4/ ~/.config/suckless


echo -nE "

 █▀▀▄ █▀▄▀█ █▀▀ █▀▀▄ █░░█ 
 █░░█ █░▀░█ █▀▀ █░░█ █░░█ 
 ▀▀▀░ ▀░░░▀ ▀▀▀ ▀░░▀ ░▀▀▀
"
wget https://dl.suckless.org/tools/dmenu-5.2.tar.gz
tar -xzvf dmenu-5.2.tar.gz
cd dmenu-5.2/
sudo make clean install
cd ..
mv dmenu-5.2/ ~/.config/suckless


echo -nE "

 █▀▀ ▀▀█▀▀ 
 ▀▀█ ░░█░░
 ▀▀▀ ░░▀░░
"
wget https://dl.suckless.org/st/st-0.9.tar.gz 
tar -xzvf st-0.9.tar.gz
cd st-0.9/
sudo make clan install
cd ..
mv st-0.9/ ~/.config//suckless

