#!/bin/bash

G="\e[32m"
Y="\e[93m"
R="\e[31m"
U="\e[0m"

OKAY="[${G}+${U}]"
INFO="[${Y}*${U}]"
WARN="[${R}!${U}]"

function check_root() {
	if [ "$(id -u)" -eq 0 ]; then
		echo -e ${WARN} "please don't run this script as root. (wtf you fearless bastard)" >&2
		exit 1
	fi
}

function print_banner() {
	clear
	echo -e "${R}
▄ •▄  ▄▄▄· ▄▄▌  ▪   ▄▄▄·▄• ▄▌ ▄▄·  ▄▄· ▪   ▐ ▄ 
█▌▄▌▪▐█ ▀█ ██•  ██ ▐█ ▄██▪██▌▐█ ▌▪▐█ ▌▪██ •█▌▐█
▐▀▀▄·▄█▀▀█ ██▪  ▐█· ██▀·█▌▐█▌██ ▄▄██ ▄▄▐█·▐█▐▐▌
▐█.█▌▐█ ▪▐▌▐█▌▐▌▐█▌▐█▪·•▐█▄█▌▐███▌▐███▌▐█▌██▐█▌
·▀  ▀ ▀  ▀ .▀▀▀ ▀▀▀.▀    ▀▀▀ ·▀▀▀ ·▀▀▀ ▀▀▀▀▀ █▪

${U}- made with ${R} tons o' love${U}, from crow ${R}<3${U}"
}

print_stage() {
    local message="$1"
    echo -e "${Y}
=============================================================
$message
=============================================================${U}"
}

function update() {
	print_stage "up(dat|grad)ing the system..."
	sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y
	print_stage "cleaning up a lil' bit..."
	sudo apt autoremove -y && sudo apt autoclean -y 
	echo -e ${OKAY} "finished! moving on..."
}

function install_programs() {
	print_stage "installing necessary programs..."
	sudo apt install hexyl dunst bat eza feh ranger bspwm alacritty picom polybar sxhkd neovim rofi btop -y 
	echo -e ${OKAY} "finished! moving on..."
}

function populate_dirs() {
	print_stage "creating configs..."
	cp -rv .config/ $HOME && cp -rv wallpapers/ $HOME/Pictures/
	chmod -v +x ~/.config/bspwm/bspwmrc && chmod -v +x ~/.config/sxhkd/sxhkdrc 
	echo -e ${OKAY} "finished! moving on..."
}

function install_fonts() {
	print_stage "installing fonts..."	
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Iosevka.zip -P $HOME/.local/share/fonts/ 
	unzip $HOME/.local/share/fonts/Iosevka.zip -d $HOME/.local/share/fonts/Iosevka
	fc-cache -vf && fc-list | grep --color=always Iosevka 
	cp -rv $HOME/.config/polybar/fonts/* $HOME/.local/share/fonts/ && rm -v $HOME/.local/share/fonts/Iosevka.zip
	echo -e ${OKAY} "finished! moving on..."
}

function update_zsh() {
	print_stage "updating zshrc..."	
	yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
	cp -rv .oh-my-zsh/ $HOME && cp -v .zshrc $HOME
	echo -e ${OKAY} "finished! moving on..."
}

function flex() {
	print_stage "time to flex a bit :sunglasses:"
	for ((i=1; i<=5; i++)); do echo -ne ${INFO} "[$i/5]\r" && sleep 1; done
	clear && echo -e ${OKAY} "${G}the installation has finished${U}! enjoy your rice, nerd! ${R}please note that a reboot/restart is required${U}.\n${OKAY} press <${Y}q${U}> to exit." | less -r 
}

check_root
print_banner
update
install_programs
install_fonts
update_zsh
populate_dirs
flex
