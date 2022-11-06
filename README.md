# xos-installer

### Create Arch Iso

Download [ArchIso](<https://archlinux.org/download/>) and put on a USB drive with [Etcher](https://www.balena.io/etcher/) or [Rufus](https://rufus.ie/en/)

### Boot and in prompt type the following commands

```
pacman -Sy --needed git
git clone https://github.com/laluxx/xos-installer
chmod -R +x xos-installer
cd xos-installer
./archx.sh
```

### No wifi?

1: Run `iwctl`

2: Run `device list`, and find your device name.

3: Run `station [device name] scan`

4: Run `station [device name] get-networks`

5: Run `station [device name] connect [network name]`, enter your password.

6: Ctrl and C to exit. 

Optional `ping archlinux.org`, and then Press Ctrl and C to stop.

### Wifi Blocked?
check if the WiFi is blocked by running `rfkill list`.

If says **Soft blocked: yes**, then run `rfkill unblock wifi`


## Desktopenv

**Arch**: is no desktop envoiriment edition.

**Awesome**: is arch with [awesome wm](https://awesomewm.org/).

## To view packages install go in pkg-files/

> ps: above END OF MINIMAL are all packages to install if you chose Full.

aur-pkgs.txt: aur installs for all distros if aur helper is none dont install anything.

pacman-pkgs.txt: default packages to install for all distros.

{distro}.txt: distro packages to install.
