#!/bin/bash 
# checks 
depends=('xclip' 'git' 'figlet')
for i in "${depends[@]}"; do
    if ! pacman -Qs $i > /dev/null; then
        sudo pacman -S $i
    fi
done
if [ ! -f ~/.config/gitler/gitler.conf ]; then
    mkdir -p ~/.config/gitler
    touch ~/.config/gitler/gitler.conf
fi 
# config file located in ~/.config/gitler/gitler.conf
config=~/.config/gitler/gitler.conf
# functions
function red() {
    echo -e "\033[31m$1\033[0m"
}
function redn() {
    echo -n -e "\033[31m$1\033[0m"
}
function green() {
    echo -e "\033[32m$1\033[0m"
}
function yellow() {
    echo -e "\033[33m$1\033[0m"
}
function chooseaurauto {
    if ! grep -q "aurauto" $config; then
        clear
        yellow "Do you want to install AUR packages automatically? (y/n)"
        echo -n " >> " ; read aurauto
        if [ $aurauto == "y" ]; then
            echo "aurauto=true" >> $config ; checkclip
        elif [ $aurauto == "n" ]; then
            echo "aurauto=false" >> $config; checkclip
        else
            echo "Invalid input"
            
        fi
    fi
}
function checkgitdir {
    if ! grep -q "gitdir" $config; then
        yellow "There is no path set yet. "; echo "Please provide one:" 
        echo -n " >> " ; read gitdir
        if [ -d $gitdir ]; then
            echo "gitdir=$gitdir" >> $config
            echo "Path set to $gitdir"
            chooseaurauto
        else
            clear
            red "Invalid path"
            checkgitdir
        fi
    fi
}
function gitclone() {
    clear
    echo "Downloading"| figlet -f small
    cd $gitdir; git clone $(cat /tmp/clipboard.txt)
    end
}
function aurclone() {
    clear
    echo "Downloading"| figlet -f small
    cd $gitdir; git clone $(cat /tmp/clipboard.txt)
    cd $(cat /tmp/clipboard.txt | sed 's/.*\///;s/\.git//')
    makepkg -si
    end
}
function end() {
    clear
    echo "Done!"| figlet -f small
    ls -la $gitdir
    exit
}
function checkclip() {
    xclip -o > /tmp/clipboard.txt
    sed -i 's/ //g' /tmp/clipboard.txt
    if grep -q "github.com" /tmp/clipboard.txt; then
        gitclone
    elif grep -q "aur.archlinux.org" /tmp/clipboard.txt; then
        if grep -q "aurauto=true" $config; then
            aurclone
        else 
            gitclone
        fi

        gitclone
    else
        clear
        echo "BROKEN  LINK"| figlet -f small
        
        red "What you clipboard contains: "; echo &(cat /tmp/clipboard.txt)
    fi
}


# main
source $config
clear
checkgitdir
checkclip


