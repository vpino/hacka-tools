#!/bin/bash

green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"

function banner() {
  clear
  echo -e "${red}"
  echo "██   ██   █████╗   ██████╗ ██   ██╗  █████╗  ████████╗  ██████╗    ██████╗  ██║      ███████╗"
  echo "██╔══██╗ ██╔══██╗ ██╔════╝ ██║ ██╗  ██╔══██╗ ╚══██╔══╝ ██╔═══██╗  ██╔═══██╗ ██║      ██╔════╝"
  echo "███████║ ███████║ ██║      █████╔╝  ███████║    ██║    ██║   ██║  ██║   ██║ ██║      ███████╗"
  echo "██╔══██║ ██╔══██  ██║      ██╔═██╗  ██╔══██║    ██║    ██║   ██║  ██║   ██║ ██║      ╚════██║"
  echo "██║  ██║ ██║  ██║ ╚██████╗ ██║  ██╗ ██║  ██║    ██║    ╚██████╔╝  ╚██████╔╝ ███████╗ ███████║"
  echo "╚═╝  ╚═  ╚═╝  ╚═   ╚═════╝   ╚═╝╚═╝ ╚═╝  ╚═     ╚═╝     ╚═════╝    ╚═════╝  ╚══════╝ ╚══════╝"
}

function permissionSUID() {

  bash ./SUID/permission-suid.sh

}

function menu() {
	banner

	echo -e "${blue}"
	sleep 0.25
	echo
	echo "1 -> SUID Permission"
	sleep 0.25
	echo
	echo "2 -> Exit"
	sleep 0.25
	echo -e "${end}"
	echo
	read -rp "--> " option

  if [ "$option" == "1" ]; then
		permissionSUID
  fi

}

if [ "$(id -u)" == "0" ]; then
	echo -e "\n${red}[!] You do not have to be root to run the tool${end}"
	echo
	exit 1
fi

menu
