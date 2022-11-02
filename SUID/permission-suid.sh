#!/bin/bash

. ./main.sh --source-only

function suid() {
	banner

	echo -e "${blue}"
	sleep 0.25
	echo
	echo "1 -> Search files and directories with SUID permissions belonging to the root user"
	sleep 0.25
	echo
	echo "2 -> Search files with SUID permissions with `ls` information "
	sleep 0.25
	echo
	echo "3 -> Search files with SUID permissions with `xargs ls -l` information"
	sleep 0.25
	echo
	echo "4 -> Search files with SUID permissions without information"
	sleep 0.25
	echo
	echo "5 -> Search files and directories with SUID permissions belonging to the root user with extends information"
	sleep 0.25
	echo
	echo "6 -> Exit"
	sleep 0.25
	echo -e "${end}"
	echo
	read -rp "--> " option

  if [ "$option" == "1" ]; then
    echo -e "${red}[!] ${yellow}Lists..."
	find / -user root -perm -4000 -print 2>/dev/null
	echo -e "${end}"
  fi

  if [ "$option" == "2" ]; then
    echo -e "${red}[!] ${yellow}Lists..."
	find / -type f -perm -04000 -ls 2>/dev/null
	echo -e "${end}"
  fi

  if [ "$option" == "3" ]; then
	echo -e "${red}[!] ${yellow}Lists..."
    find / -type f -perm -u=s 2>/dev/null | xargs ls -l
	echo -e "${end}"
  fi

  if [ "$option" == "4" ]; then
    echo -e "${red}[!] ${yellow}Lists..."
	find / -perm -u=s -type f 2>/dev/null
	echo -e "${end}"
  fi

  if [ "$option" == "5" ]; then
  	echo -e "${red}[!] ${yellow}Lists..."
    find / -user root -perm -4000 -exec ls -ldb {} \;
	echo -e "${end}"
  fi

}

suid
