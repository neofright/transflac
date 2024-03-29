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
		printf "\nScript must be invoked via source command\nExiting\n"
		exit;;
esac

until [[ "$valid_output" == "YES" ]]; do

	case $output_lossy_dir in
		*[!/]*/) output_lossy_dir="${output_lossy_dir%"${output_lossy_dir##*[!/]}"}";;
	esac

	case ${output_lossy_dir^^} in
		"QUIT"|"EXIT"	)
			printf "${RED}%s${RESTORE}\n" "Exiting.  You entered $output_lossy_dir."
			exit;;
		"-H"|"--HELP"	)
			source "$SRC/src-tf-help.sh"
			exit;;
		esac
	
	## https://apple.stackexchange.com/questions/453325/changing-realpath-utility-on-macos-ventura
	if [[ $(uname) == "Darwin" ]]
	then
		rp_output_lossy_dir="$( realpath "$output_lossy_dir" 2>/dev/null )"
	else
		rp_output_lossy_dir="$( realpath -P "$output_lossy_dir" 2>/dev/null )"
	fi
	
	if [[ -d "$rp_output_lossy_dir" ]];
	then
		output_dir_existed="YES"
	elif [[ "$output_lossy_dir" != "" ]];
	then
		mkdir_output="$( mkdir "$output_lossy_dir" 2>&1 )"
		output_dir_existed="NO"
	fi

	if [[ -z "${mkdir_output+x}" ]] && [[ "$output_dir_existed" == "YES" ]] && [[ "$output_lossy_dir" != "" ]];
	then
		valid_output="YES"
		source "$SRC/src-tf-figlet.sh"
		printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n" "INPUT  " "Directory " "$rp_input_flac_dir" " accepted"
		printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s${RESTORE}\n\n" "OUTPUT " "Directory " "$rp_output_lossy_dir" " accepted"
	else
		valid_output="NO"
		mkdir_error="${mkdir_output##*: }"
		mkdir_error="${mkdir_error%%$'\n'*}"
		source "$SRC/src-tf-figlet.sh"
		printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n\n" "INPUT  " "Directory " "$rp_input_flac_dir" " accepted"
		if [[ "$output_lossy_dir" != "" ]];
		then
			printf "${RED}%s${YELLOW}%s${RESTORE}\n" "Invalid Output Directory:  " "$output_lossy_dir"
			printf "${RED}%s${YELLOW}%s${RESTORE}\n\n" "Error Description:  " "$mkdir_error"
		fi
		printf "${GREEN}%s${CYAN}\n" "Please enter output directory and press"
		read -rep "[ENTER]:  " output_lossy_dir lossy_codec codec_quality
		printf "${RESTORE}\n"
	fi

done

return
