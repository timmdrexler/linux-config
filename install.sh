#!/bin/bash
#rsync -av --delete ./icons/ ~/.icons/
#rsync -av --delete ./themes/ ~/.themes/

cp -R ./icons/* /usr/share/icons
#cp -R ./themes/* /usr/share/themes

apt install openbox lxappearance pcmanfm gtk-chtheme lxterminal obmenu firefox arc-theme xinit x11-xserver-utils
