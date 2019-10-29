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
		printf "%s\nScript must be invoked via source command\nExiting\n"
		exit;;
esac

until [[ $valid_dir == "YES" ]]; do

	case $input_flac_dir in
		*[!/]*/) input_flac_dir=${input_flac_dir%"${input_flac_dir##*[!/]}"};;
	esac


	case ${input_flac_dir^^} in
		"QUIT"|"EXIT"	)
		printf "${RED}%s${RESTORE}\n" "Exiting.  You entered $input_flac_dir."
		exit;;
	"-H"|"--HELP"	)
		source $SRC/src-tf-help.sh
		exit;;
esac

	flac_count=$( find $input_flac_dir 2>/dev/null | grep -c "\.flac" )
	total_flac=$flac_count

	if [[ -d $input_flac_dir && $flac_count -gt 0 ]];
	then
		valid_dir="YES"
		source $SRC/src-tf-figlet.sh
		printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s${RESTORE}\n\n" "INPUT  " "Directory " "$input_flac_dir" " accepted"
	else
		clear
		printf "${BLUE}${BOLD}"
		( figlet TransFLAC )
		printf "${RESTORE}"
		if [[ $input_flac_dir != "" ]];
		then
			printf "${RED}%s${YELLOW}%s${RESTORE}\n\n" "Invalid FLAC Directory:  " "$input_flac_dir"
		fi
		printf "${GREEN}%s${CYAN}\n" "Please enter input FLAC directory and press"
		read -e -p "[ENTER]:  " input_flac_dir output_lossy_dir lossy_codec codec_quality
		printf "${RESTORE}\n"
	fi

done

return
