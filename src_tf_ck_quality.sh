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

supported_quality="Supported:  LOW | MEDIUM | STANDARD | HIGH | PREMIUM"

until [[ $valid_quality == "YES" ]]; do

	case "${codec_quality^^}" in
		"LOW"|"MEDIUM"|"STANDARD"|"HIGH"|"PREMIUM"	)
			valid_quality="YES"
			source $SRC/src_tf_figlet.sh
			printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n" "INPUT  " "Directory " "$input_base_dir" " accepted"
			printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n" "OUTPUT " "Directory " "$output_base_dir" " accepted"
			printf "${RED}%s${YELLOW}%s${RESTORE}\n" "Transcoding: " "FLAC to ${output_codec^^}"
			codec_index=${codec_quality^^};;
		"QUIT"|"EXIT"	)
			printf "${RED}%s\n${RESTORE}\n" "Exiting.  You entered $codec_quality."
			exit;;
		"-H"|"--HELP"▷⋅⋅)
			source $SRC/src_tf_help.sh
			exit;;
		*	)
			if [[ $codec_quality != "" ]]
			then
				source $SRC/src_tf_figlet.sh
				printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n" "INPUT  " "Directory " "$input_base_dir" " accepted"
				printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n" "OUTPUT " "Directory " "$output_base_dir" " accepted"
				printf "${RED}%s${YELLOW}%s\n" "Transcoding: " "FLAC to ${output_codec^^}"
				printf "${RED}%s${YELLOW}%s${RESTORE}\n\n" "Invalid CODEC QUALITY: " "$codec_quality"
			fi
			printf "${GREEN}%s\n" "Please enter desired CODEC QUALITY"
			printf "${YELLOW}%s${CYAN}\n" "$supported_quality"
			read -p '[ENTER]:  ' codec_quality
			printf "${RESTORE}\n";;
	esac

done

return