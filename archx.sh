#!/bin/bash
#
# @file xos-installer 
# @brief Entrance script that launches children scripts for each phase of installation.
# Find the name of the folder the scripts are in
set -a
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts
CONFIGS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/configs
set +a
pacman -Sy --noconfirm --needed
pacman -S --noconfirm --needed terminus-font
setfont ter-v22b
clear

echo -nE "
    _____                    __         _____                          
   /  _  \  _______  ____   |  |__     /     \  ____     ____   __ __ 
  /  /_\  \ \_  __ \/ ___\  |  |  \   /  \ /  \/ __ \   /    \ |  |  \ 
 /    |    \ |  | \/\  \___ |   Y  \ /    Y    \  ___/ |   |  \|  |  /
 \____|__  / |__|    \___  >|___|  / \____|__  /\___  >|___|  /|____/ 
         \/              \/      \/          \/     \/      \/        
                  _____________________________________
                  \      Automated xos installer      /
                   \_________________________________/

                Scripts are in directory named xos-installer

"

    ( bash $SCRIPT_DIR/scripts/startup.sh )|& tee startup.log
      source $CONFIGS_DIR/setup.conf
    ( bash $SCRIPT_DIR/scripts/0-preinstall.sh )|& tee 0-preinstall.log
    ( arch-chroot /mnt $HOME/xos-installer/scripts/1-setup.sh )|& tee 1-setup.log
    if [[ ! $DESKTOP_ENV == arch ]]; then
      ( arch-chroot /mnt /usr/bin/runuser -u $USERNAME -- /home/$USERNAME/xos-installer/scripts/2-user.sh )|& tee 2-user.log
    fi
    ( arch-chroot /mnt $HOME/xos-installer/scripts/3-post-setup.sh )|& tee 3-post-setup.log
    mkdir -p /mnt/home/$USERNAME/.logs/
    cp -v *.log /mnt/home/$USERNAME/.logs/

    ./home/$USERNAME/xos-installer/pkg-files/xos.sh
    
echo -nE "
               __________ __          __          __     
               \_  _____/|__|  ____  |__|  ______|  |__  
                |   __)  |  | /    \ |  | /  ___/|  |  \ 
                |    \   |  ||   |  \|  | \___ \ |   Y  \ 
                \__  /   |__||___|  /|__|/____  >|___|  /
                   \/             \/          \/      \/ 
                  _____________________________________
                  \      Automated xos installer      /
                   \_________________________________/

              Done - Please Eject Install Media and Run reboot

"
