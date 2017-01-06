#!/bin/bash

echo "Do you want to copy icon theme?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) cp -R ./icons/* /usr/share/icons; break;;
		No ) echo "Icon theme skipped"; break;;
	esac
done

echo "Do you want to copy GTK theme?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) cp -R ./themes/* /usr/share/themes; break;;
		No ) echo "GTK theme skipped"; break;;
	esac
done

echo "Install base Xorg with OpenBox?" 
select yn in "Yes" "No"; do
	case $yn in
		Yes ) apt install openbox lxappearance feh pcmanfm gtk-chtheme lxterminal obmenu xinit x11-xserver-utils htop firefox; break;;
		No ) echo "Xorg skipped"; break;;
	esac
done

echo "Install graphical applications?" 
select yn in "Yes" "No"; do
	case $yn in
		Yes ) apt install blender gimp inkscape; break;;
		No ) echo "Graphical applications skipped"; break;;
	esac
done

echo "Install wine and playonlinux?" 
select yn in "Yes" "No"; do
	case $yn in
		Yes ) dpkg --add-architecture i386; apt install wine playonlinux winetricks; break;;
		No ) echo "Wine applications skipped"; break;;
	esac
done

echo "Install audio applications?" 
select yn in "Yes" "No"; do
	case $yn in
		Yes ) apt install audacity lmms pavucontrol; break;;
		No ) echo "Audio applications skipped"; break;;
	esac
done

#apt install openbox lxappearance pcmanfm gtk-chtheme lxterminal obmenu firefox xinit x11-xserver-utils htop

