#!/bin/bash

function default
{
echo    "--all key displays the IP addresses and symbolic names of all hosts in the current subnet. Please install nmap before"	
echo    "--target key displays a list of open system TCP ports."

}

function target
{
echo "Opened tcp ports:"
netstat -ltn
}
function all
{
echo  "It may take a few minutes"

netw=$(ip addr |grep -i global | awk '{print $2}')
	for item in $netw
	do
  		nmap -sn $item | grep report | sed 's/Nmap scan report for //'
	done
#echo  $netw
}

case  "$1" in
--all)
all;
;;
--target)
target;
;;
*)
default;
;;

esac
