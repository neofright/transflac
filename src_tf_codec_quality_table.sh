# Copyright © 2015-2019 Gerald B. Cox
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

case $BASH_SOURCE in
	$0	)
		printf "%sScript must be invoked via source command\n"
		printf "%sExiting\n"
	exit;;
esac

declare -A OPUS
OPUS["LOW"]="48"
OPUS["MEDIUM"]="64"
OPUS["STANDARD"]="96"
OPUS["HIGH"]="128"
OPUS["PREMIUM"]="192"

declare -A OGG
OGG["LOW"]="1"
OGG["MEDIUM"]="2"
OGG["STANDARD"]="3"
OGG["HIGH"]="4"
OGG["PREMIUM"]="5"

declare -A AAC
AAC["LOW"]="1"
AAC["MEDIUM"]="2"
AAC["STANDARD"]="3"
AAC["HIGH"]="4"
AAC["PREMIUM"]="5"

declare -A MP3
MP3["LOW"]="8"
MP3["MEDIUM"]="7"
MP3["STANDARD"]="6"
MP3["HIGH"]="5"
MP3["PREMIUM"]="4"

return
