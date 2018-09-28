#!/bin/bash
#
#  		iplocator.sh
#  
#  Copyright 2017 c.realkiller <dino.tartaro@gmail.com>
#  
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
# 
lname=`basename $0 | cut -d '.' -f 1`
cle(){
	clear
	clear
	clear
	echo -e '#####################################################################'
	echo -e '#                         IP LOCATE IN:                             #'
	echo -e '#####################################################################'
}

reverse_ip(){
	cle
	w3m -dump http://www.ip-tracker.org/locator/ip-lookup.php?ip=$iploc | sed -n -e 77,126p | sed -e  '/^$/d' -e 's/^[ \t]*//;s/[ \t]*$//'
}
echo "========= ${lname^^} =========="
if ping -c 1 google.com >> /dev/null 2>&1; then
	w3m -dump http://www.ip-tracker.org/  | sed -n -e 64,65p -e 86,87p -e 98,113p -e 127p -e 144,148p |  sed -e  '/^$/d' -e 's/^[ \t]*//;s/[ \t]*$//'
	echo "(CTRL+C to CLOSE OR)"
	read -p "Insert another IP to locate it : " iploc
	cle
		if [[ "$iploc" =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$ ]]
		then
			reverse_ip
				while (true)
				do
					echo "(CTRL+C to CLOSE OR)"
					read -p "Insert another IP to locate it : " iploc
					if [[ "$iploc" =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$ ]]
					then
						reverse_ip
						else
						echo "IP ERROR:......EXIT"
						sleep 5
						exit 0
					fi	
						
				done
					
			else
			echo  "IP ERROR:.......EXIT"
			sleep 5
			exit 0
		fi
	else
	echo "Check your internet connection"
	echo "and launch another instance..!"
	echo "           EXIT..."
	sleep 4
	exit 0
fi
exit 0
