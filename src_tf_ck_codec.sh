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

if [[ "$(rpm -q ffmpeg)" =~ "not installed" ]]
then
	supported_codecs="Supported:  OPUS | OGG"
	codecs="@(OPUS|OGG)"
else
	supported_codecs="Supported:  OPUS | OGG | AAC | MP3"
	codecs="@(OPUS|OGG|AAC|MP3)"
fi

until [[ $valid_codec == "YES" ]]; do

	case "${output_codec^^}" in
		$codecs	)
			valid_codec="YES"
			printf "${GREEN}%s${YELLOW}%s${GREEN}%s\n${RESTORE}\n" /
				"Transcoding from FLAC to ${output_codec^^}";;

		QUIT	)
			printf "${RED}%s\n${RESTORE}\n" "Exiting.  You entered quit."
			exit;;

		*	)
			printf "${GREEN}%s\n" "Please enter desired output CODEC"
			printf "${YELLOW}%s${CYAN}\n" "$supported_codecs"
			read -p "[ENTER]:  " output_codec
			printf "${RESTORE}\n";;
	esac

done

shopt -u extglob

return
