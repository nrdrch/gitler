#!/bin/bash 
red=$(tput setaf 1)
green=$(tput setaf 2)
normal=$(tput sgr0)
link="https://*.git*"
gitdir="$HOME/GitDir/"
if [[ $(xclip -o) = $link ]] ; 
    then cd $gitdir ; printf "${green}Starting${normal}" ; git clone $(xclip -o) ; clear ; printf "${green}Done! ${normal}" ; echo ""
    exa -la; cd $gitdir
else printf "${red}Not A Valid Link${normal}"
fi
