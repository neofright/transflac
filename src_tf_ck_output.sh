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

	case $output_base_dir in
		*[!/]*/) output_base_dir=${output_base_dir%"${output_base_dir##*[!/]}"};;
	esac

	case ${output_base_dir^^} in
		"QUIT"|"EXIT"▷⋅⋅)
			printf "${RED}%s${RESTORE}\n" "Exiting.  You entered $output_base_dir."
			exit;;
		"-H"|"--HELP"	)
			source $SRC/src_tf_help.sh
			exit;;
		esac

	mkdir_output=$(mkdir $output_base_dir 2>&1 > /dev/null)

	if [[ $mkdir_output != *"No such file"* ]] && \
	[[ $mkdir_output != *"missing"* ]];
	then
		valid_output="YES"
		source $SRC/src_tf_figlet.sh
		printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n" "INPUT  " "Directory " "$input_base_dir" " accepted"
		printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s${RESTORE}\n\n" "OUTPUT " "Directory " "$output_base_dir" " accepted"
	else
		valid_output="NO"
		if [[ $output_base_dir != "" ]]
		then
			source $SRC/src_tf_figlet.sh
			printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n" "INPUT  " "Directory " "$input_base_dir" " accepted"
			printf "${RED}%s${YELLOW}%s${RESTORE}\n\n" "Invalid Output Directory:  " "$output_base_dir"
		fi
		printf "${GREEN}%s${CYAN}\n" "Please enter output directory and press"
		read -e -p "[ENTER]:  " output_base_dir output_codec codec_quality
		printf "${RESTORE}\n"
	fi

done

return
