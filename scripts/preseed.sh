#!/bin/bash

# preseed configuration for unattended installation
(
cat <<EOF
dash dash/sh boolean false
tzdata tzdata/Areas select Europe
tzdata tzdata/Zones/Europe select Rome
locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8, it_IT.UTF-8 UTF-8
locales locales/default_environment_locale select en_US.UTF-8
keyboard-configuration	keyboard-configuration/model	select	Generic 105-key (Intl) PC
keyboard-configuration	keyboard-configuration/modelcode	string	pc105
keyboard-configuration	keyboard-configuration/variant	select	Italian
keyboard-configuration	keyboard-configuration/layoutcode	string	it
keyboard-configuration	keyboard-configuration/xkb-keymap	select	it
EOF
) | debconf-set-selections

# apply configuration to already installed packages
DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true LC_ALL=C LANGUAGE=C LANG=C dpkg --configure -a
