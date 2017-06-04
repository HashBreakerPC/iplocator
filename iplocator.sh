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
#get ip
#
#To make the anonymous operating system and browser uncomment the variable us
#us='--header="Accept: text/html" --user-agent="Mozilla/5.0 Gecko/20100101 Firefox/45.0"'
lname=`basename $0 | cut -d '.' -f 1`
close=""
	while [[ "$close" = "" ]]
	do
	echo "========= ${lname^^} =========="
	if ping -c 1 google.com >> /dev/null 2>&1; then
		wget $us https://www.tracemyip.org/ -O 2>/dev/null .info.tmp
		IP=`grep -oP '(?<=<input name="IP" type="text" class="fieldBOXIP" style="text-align: center;" onClick="this.focus()).*?(?=size="16" readonly>)' .info.tmp | cut -d '"' -f 3`
		STATE=`grep -oP '<div class="resp_block_1 divWHSP tdLM">.*?(?=</div>)' .info.tmp | sed '1d;3,5d' | cut -d '>' -f 2`
		INFO=`grep -oP '<td class="td.*?><span class="t.*?(?=</span>)' .info.tmp | cut -d '>' -f3 | sed -e '1d;10d;11d;12d'`
		OS=`grep -oP '<div class="resp_block_1 divWHSP tdLM">.*?(?=</div>)' .info.tmp | sed '1d;2d;3d;5d' | cut -d '>' -f 2`
		#print ip
		echo "Your IP address is: $IP"
		echo "COUNTRY: $STATE"
		echo "$INFO"
		echo "OS = $OS"
		echo
		read -p "CTRL+C or any key + ENTER to close: " close
		else
		echo "Check your internet connection"
		echo "and launch another instance..!"
		echo "           EXIT..."
		sleep 4
	fi
done
exit 0
