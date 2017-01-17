#!/bin/bash

echo "Install base Xorg with OpenBox?" 
select yn in "Yes" "No"; do
	case $yn in
		Yes ) 	add-apt-repository ppa:numix/ppa; apt update; apt install \
			openbox openbox-menu tint2 wicd arc-theme numix-icon-theme-circle\
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
	cp -r ./config/gtk-3.0 ~/.config
	cp -r ./config/volumeicon ~/.config
	cp ./config/gtkrc-2.0 ~/.gtkrc-2.0
	cp ./config/background.jpg ~/Pictures
	#cp -r ./icons/* ~/.icons
	cp -r ./themes/* ~/.themes
	cp ./config/tint2rc ~/.config/tint2/tint2rc
	#cp ./config/bg-saved.cfg ~/.config/nitrogen/bg-saved.cfg
	
	#Create nitrogen config files
	touch ~/.config/nitrogen/nitrogen.cfg
	echo "[geometry]" >> ~/.config/nitrogen/nitrogen.cfg
	echo "posx=200" >> ~/.config/nitrogen/nitrogen.cfg
	echo "posy=20" >> ~/.config/nitrogen/nitrogen.cfg
	echo "sizex=450" >> ~/.config/nitrogen/nitrogen.cfg
	echo "sizey=500" >> ~/.config/nitrogen/nitrogen.cfg
	echo " " >> ~/.config/nitrogen/nitrogen.cfg
	echo "[nitrogen]" >> ~/.config/nitrogen/nitrogen.cfg
	echo "view=icon" >> ~/.config/nitrogen/nitrogen.cfg
	echo "icon_caps=false" >> ~/.config/nitrogen/nitrogen.cfg
	echo "dirs=/home/$SUDO_USER/Pictures;" >> ~/.config/nitrogen/nitrogen.cfg

	touch ~/.config/nitrogen/bg-saved.cfg
	echo "[:0.0]" >> ~/.config/nitrogen/bg-saved.cfg
	echo "file=/home/$SUDO_USER/Pictures/background.jpg" >> ~/.config/nitrogen/bg-saved.cfg
	echo "mode=4" >> ~/.config/nitrogen/bg-saved.cfg
	echo "bgcolor=#000000" >> ~/.config/nitrogen/bg-saved.cfg

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

	chown "$SUDO_USER":"$SUDO_USER" ~/.gtkrc-2.0
	chmod 664 ~/.gtkrc-2.0
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
