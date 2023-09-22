Scripts for Linux (scripts4linux)
============
Script collection for linux forked from [ggeorgovassilis/linuxscripts](https://github.com/ggeorgovassilis/linuxscripts)

## Install Scripts
Installation of application or services from the Linux Shell is transparent and you can see every single step and analyze and debug the installation procedure. Install scripts aggregate those steps with a shell scripts that can be found in the subdirectory `install/`. 

### Files and Folders for Install Scripts 
Install scripts are organized by application name e.g. `install/kdeconnect` for the application KDE connect. Installation commands vary in general depending on Linux distro, so it necessary to adapt the scripts to the Linux distribution and sometimes even to the version. Therefore the script contains a variable name that contains distro names and version on which it was tested. 

### Naming of Scripts
The filename should contain the base name of the application (e.g. `kdeconnect`) and the distro for which the install script created and tested separated by a `4` followed by the linux distro name e.g. `kdeconnect4ubuntu.sh`). If the installation is more complex and even dependent on the version of the distro you can add the version number of the distro to filename of the install script is depending on the version on which you tested the installation script.
 
### Create new scripts for other Linux Distros
If you want to test the script for a newer version it is recommended to open the script and call the script command by command and if everything runs through smoothly you might want to add a new distro and version as install script and create a Pull Request to this repository.

### List of Install Script
The following list of install scripts are available:

#### KDE Connect
[KDE connect](https://kdeconnect.kde.org/) is often pre-installed on you linux distro but a port of your firewall must be opened for a mobile phone desktop linux communication and file exchange. The name `kdeconnect` contains `KDE` but the application can be installed also on KDE desktop environments.

## powersave

Enables some powersaving on the Asus N56VB and Ubuntu 12.04. Should work on other computers and Linuxes as well. In order to enable power saving run the script with an argument of either light, on or extra like this:

```sh
powersave.sh light
```

The script contains self-explanatory functions grouped under a big CASE that enable various power saving features. Depending on your needs, you can re-arrange these functions to different cases. For example, I work mostly in a wireless setup, so I moved the "disable_ethernet" function to the "light" case. Also, when on the road, I don't do heavy processing, so I moved "make_cpus_sleep" to the "on" case - however my applications need a lot of CPU at work, so I'm not running the "make_cpus_sleep" function in the "light" setting. 

## powersave-acer-nitro5.sh

Script for reducing power consumption of the Acer Nitro 5. Has four options low/medium/full/reset. The frist three do what they say, eg. "low" disables most CPU cores, pins frequency at the lowest value, reduces graphics card frequency etc. "full" undoes all power saving measures. "reset" is like "low", but first resets power saving settings - that's needed mostly after resuming from standby.

## brightness

Allows for finer brightness control for the Asus N56VB and Ubuntu 12.04. You probably need to adjust the "B" variable in the script.

```sh
brightness.sh down
```

## usb-headset

Handles some automatic volume adjustment (like enabling the headset and muting other equipment). You probably will have to adjust the device names.

## wifi-picker

Useful in a topology with a WLAN and multiple access points, will pick the AP with the strongest signal and connect. Must be run as root because iwlist
won't return a list of SSIDs otherwise.

```sh
wifi-picker.sh <interface> <SSID>
```

e.g.

```sh
sudo wifi-picker.sh wlan0 home_wifi
```

Note: You might need to restart some applications or even services after running the script, e.g. Firefox won't be able to connect to Google or Facebook.

## ip6-firewall

Example script that shows how to harden an ip6 enabled web server. Closes down everything other than port 22 (ssh), 80 (http), 6081 (varnish) and ICMP and redirects traffic from port 80 to 6081.

## some extra keyboard mappings

Example script from [here](http://larsmichelsen.com/open-source/german-umlauts-on-us-keyboard-in-x-ubuntu-10-04/) that adds some special characters
for European languages to an US keyboard mapping. 

## control the tp-link hs100, hs110 and hs200 wlan smart plugs
[See repository](https://github.com/ggeorgovassilis/linuxscripts/tree/master/tp-link-hs100-smartplug)

## tools for proxying a nordvpn socks5 proxy

Runs haproxy as a proxy to nordvpn. [See repository](https://github.com/ggeorgovassilis/linuxscripts/blob/master/nordvpn-proxy/README.md)

Snoop around the nordvpn-proxy directory for other tools.

## checksum-directory
Compute the checksum of a directory and contents. Useful to make sure a location hasn't been corrupted. Must be invoked from directory to check.
```sh
cd /path/to/check
/path/to/script/compute-checksum.sh
```
A
```
compute-checksum.sh

## qrcodes
Script that converts a file to a series of QR codes and assembles QR codes back together into file. Doesn't work very well on big files :-(

Convert "file" into a series of QR codes stored in the current directory as PNG images:

```sh
make-qr.sh sourcefile
```

Convert QR codes back into file. Takes all PNG files named part.somenumber.png in the current directory:
```sh
restore-qr.sh outputfile
```

## reset-pci_device
Reset a PCI device (like in my case, the Atheros wifi module) when the driver isn't responding and reloads the driver
```sh
reset-pci-device.sh
```

## acer-nitro5-powerbutton-workaround.sh
After an update in October 2022, the power button doesn't work anymore in Ubuntu 20.04. This script works around the issue by tailing syslog.
I added it to the startup application list which runs scripts after the user logs in to the desktop.

## touchpad-volume-control.sh
Multi-touch volume control. Allows sound volume change through touchpad gestures. Use a three-finger touch gesture to increase volume by scrolling up, decrease volume by scrolling down. You probably need to edit the script and set the touchpad event device in the "touchpad_device" variable. You also need to make that device readable for your user. The script needs to be run as the current user, not root. 

```sh
touchpad-volume-control.sh
```

