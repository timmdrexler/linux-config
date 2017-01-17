#!/bin/bash

echo "Install base Xorg with OpenBox?" 
select yn in "Yes" "No"; do
	case $yn in
		Yes ) apt install openbox openbox-menu tint2 wicd \
			file-roller gsimplecal mousepad volumeicon-alsa \
			nitrogen compton lxappearance feh pcmanfm lxterminal \
			obmenu xinit x11-xserver-utils htop firefox \
			chromium-browser; XINSTALL="YES"; break;;
		No ) echo "Xorg skipped"; XINSTALL="NO" break;;
	esac
done

if [ "$XINSTALL" = "YES" ]; then

	#Copy themes and setup GUI config files
	mkdir ~/.config; mkdir ~/.icons; mkdir ~/.themes; mkdir ~/.config/tint2; mkdir ~/.config/nitrogen; mkdir ~/Pictures
	cp -r ./config/openbox ~/.config
	cp ./config/background.jpg ~/Pictures
	#cp -r ./icons/* ~/.icons
	add-apt-repository ppa:numix/ppa
	apt update
	apt install numix-icon-theme-circle
	cp -r ./themes/* ~/.themes
	cp ./config/tint2rc ~/.config/tint2/tint2rc
	cp ./config/bg-saved.cfg ~/.config/nitrogen/bg-saved.cfg

	#Fix permissions
	#chmod 700 ~/.config; chown $USER:$USER ~/.config
	find ~/.config -exec chown "$SUDO_USER":"$SUDO_USER" {} +
	find ~/.config -type d -exec chmod 700 {} +
	find ~/.config -type f -exec chmod 600 {} +

	#chmod 700 ~/.themes; chown $USER:$USER ~/.themes
	find ~/.themes -exec chown "$SUDO_USER":"$SUDO_USER" {} +
	find ~/.themes -type d -exec chmod 700 {} +
	find ~/.themes -type f -exec chmod 600 {} +

	#chmod 700 ~/.icons; chown $USER:$USER ~/.icons
	find ~/.icons -exec chown "$SUDO_USER":"$SUDO_USER" {} +
	find ~/.icons -type d -exec chmod 700 {} +
	find ~/.icons -type f -exec chmod 600 {} +

	find ~/Pictures -exec chown "$SUDO_USER":"$SUDO_USER" {} +
	find ~/Pictures -type d -exec chmod 755 {} +
	find ~/Pictures -type f -exec chmod 664 {} +
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
