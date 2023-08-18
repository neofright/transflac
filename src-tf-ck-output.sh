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

until [[ $valid_output == "YES" ]]; do

	case "${output_lossy_dir^^}" in
		"QUIT"|"EXIT"	)
			printf "${CERROR}%s${RESTORE}\n" "Exiting.  You entered $output_lossy_dir."
			exit;;
		"-H"|"--HELP"	)
			source "SRC/src-tf-help.sh"
			exit;;
		esac
	
	rp_output_lossy_dir=$( realpath -P "$output_lossy_dir" 2>/dev/null )
	if [[ -d "$rp_output_lossy_dir" ]];
	then
		if [[ -w "$rp_output_lossy_dir" ]];
		then
			output_dir_existed="YES"
		else
			output_dir_existed="NO"
			dir_error="Permission denied"
		fi
	else
		output_dir_existed="NO"
		dir_error="Not a directory"
	fi

	if [[ "$output_dir_existed" == "YES" ]];
	then
		valid_output="YES"
		source "SRC/src-tf-figlet.sh"
		printf "${CNOTICE}%s${CINFO}%s${CHOICE}%s${CINFO}%s\n" "INPUT  " "Directory " "$rp_input_flac_dir" " accepted"
		printf "${CNOTICE}%s${CINFO}%s${CHOICE}%s${CINFO}%s${RESTORE}\n\n" "OUTPUT " "Directory " "$rp_output_lossy_dir" " accepted"
	else
		valid_output="NO"
		source "$SRC/src-tf-figlet.sh"
		printf "${CNOTICE}%s${CINFO}%s${CHOICE}%s${CINFO}%s\n\n" "INPUT  " "Directory " "$rp_input_flac_dir" " accepted"
		if [[ $output_lossy_dir != "" ]];
		then
			printf "${CERROR}%s${CHOICE}%s${RESTORE}\n" "Invalid Output Directory:  " "$output_lossy_dir"
			printf "${CERROR}%s${CHOICE}%s${RESTORE}\n\n" "Error Description:  " "$dir_error"
		fi
		printf "${CQUESTION}%s${CPROMPT}\n" "Please enter output directory and press"
		read -ep "[ENTER]:  " output_lossy_dir lossy_codec codec_quality
		printf "${RESTORE}\n"
	fi

done

return
