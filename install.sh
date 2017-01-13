#!/bin/bash

echo "Install base Xorg with OpenBox?" 
select yn in "Yes" "No"; do
	case $yn in
		Yes ) apt install openbox tint2 gsimplecal volumeicon nitrogen compton lxappearance feh pcmanfm lxterminal obmenu xinit x11-xserver-utils htop firefox chromium-browser; XINSTALL="YES"; break;;
		No ) echo "Xorg skipped"; XINSTALL="NO" break;;
	esac
done

if [ $XINSTALL = "YES" ]; then
	echo "Do you want to install icon theme?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes ) cp -R ./icons/* /usr/share/icons; break;;
			No ) echo "Icon theme skipped"; break;;
		esac
	done

	echo "Do you want to install GTK theme?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes ) mkdir ~/.themes; cp -r ./themes/* ~/.themes/; cp ~/.themes/Diehard4/tint2rc ~/.config/tint2/default.tint2rc; break;;
			#Yes ) cp -R ./themes/* /usr/share/themes; find /usr/share/themes -type d -exec chmod 755 {} +; find /usr/share/themes -type f -exec chmod 644 {} +; cp /usr/share/themes/ break;;
			No ) echo "GTK theme skipped"; break;;
		esac
	done

	#Setup GUI config files	
	cp -r ./config/openbox ~/.config
	cp ./config/background.png ~/Pictures

fi

#=======================================================

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

echo "Customization Complete!"
