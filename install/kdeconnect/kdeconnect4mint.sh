#!/bin/sh
APPNAME="KDEconnect"
# set DISTRO  to "Ubuntu", "Mint" "Debian" or "Fedora"
DISTRO="Mint"
LINVERSION="21"

echo "$APPNAME Installation Script for $DISTRO $LINVERSION"
INSTALLJAMULUS="no"
while true; do
    read -p "Do you wish to install $APPNAME on $DISTRO $LINVERSION? (y/n) " yn
    case $yn in
        [Yy]* ) 
           echo "Call apt-get update on $DISTRO $LINVERSION"
           sudo apt-get update
           echo "Start Installation $APPNAME for $DISTRO $LINVERSION"
           sudo apt-get install kdeconnect
           echo "Open Firewall Port so that $APPNAME on your Android smartphone can communicate with $DISTRO $LINVERSION"
           sudo ufw allow 1714:1764/udp && sudo ufw allow 1714:1764/tcp sudo ufw reload
           INSTALLJAMULUS="yes" 
           break;;
        [Nn]* ) 
           echo "Cancelled Jamulus Installation on $DISTRO $LINVERSION"
           exit;;
        * ) echo "Please answer 'Y' for yes or 'N' for no.";;
    esac
done

if [ "$INSTALLJAMULUS" = "yes" ]; then     

  echo "(1) Install of $APPNAME for $DISTRO $LINVERSION DONE"
  echo "(2) Install $APPNAME on your Android device with F-Droid https://f-droid.org/packages/org.kde.kdeconnect_tp/ "
  echo "(3) Connect/pair Smartphone and  $DISTRO $LINVERSION by starting $APPNAME on both devices.
   
else

	echo "Installation of of $APPNAME for $DISTRO $LINVERSION  cancelled"

fi
