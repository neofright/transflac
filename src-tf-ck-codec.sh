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

shopt -s extglob

supported_codecs="Supported:  OPUS | OGG | AAC | MP3"
codecs="@(OPUS|OGG|AAC|MP3)"

until [[ $valid_codec == "YES" ]]; do

	case "${lossy_codec^^}" in
		$codecs	)
			valid_codec="YES"
			LOSSY_CODEC=${lossy_codec^^}
			source $SRC/src-tf-figlet.sh
			printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n" "INPUT  " "Directory " "$rp_input_flac_dir" " accepted"
			printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n" "OUTPUT " "Directory " "$rp_output_lossy_dir" " accepted"
			printf "${RED}%s${YELLOW}%s\n${RESTORE}\n" "Transcoding: " "FLAC to $LOSSY_CODEC";;
		"QUIT"|"EXIT"	)
			if [[ $output_dir_existed == "NO" ]];
			then
				rmdir $output_lossy_dir &> /dev/null
			fi
			printf "${RED}%s\n${RESTORE}\n" "Exiting.  You entered $lossy_codec."
			exit;;
		"-H"|"--HELP"▷⋅⋅)
			source $SRC/src-tf-help.sh
			exit;;
		*	)
			source $SRC/src-tf-figlet.sh
			printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n" "INPUT  " "Directory " "$rp_input_flac_dir" " accepted"
			printf "${RED}%s${GREEN}%s${YELLOW}%s${GREEN}%s\n\n" "OUTPUT " "Directory " "$rp_output_lossy_dir" " accepted"
			if [[ $lossy_codec != "" ]]
				then
				printf "${RED}%s${YELLOW}%s${RESTORE}\n\n" "Invalid Output Codec:  " "$lossy_codec"
			fi
			printf "${GREEN}%s\n" "Please enter desired output CODEC"
			printf "${YELLOW}%s${CYAN}\n" "$supported_codecs"
			read -p "[ENTER]:  " lossy_codec codec_quality
			printf "${RESTORE}\n";;
	esac

done

shopt -u extglob

return
