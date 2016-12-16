#!/bin/bash
#rsync -av --delete ./icons/ ~/.icons/
#rsync -av --delete ./themes/ ~/.themes/

cp -R ./icons/* /usr/share/icons
cp -R ./themes/* /usr/share/themes

