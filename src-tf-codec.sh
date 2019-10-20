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

case "${output_codec^^}" in
	"OPUS"	)
			codec_filetype="opus";;
	"OGG"	)
			codec_filetype="ogg";;
	"AAC"	)
			codec_filetype="m4a";;
	"MP3"	)
			codec_filetype="mp3";;
esac

if [[ "$filetype" = "flac" ]] && [[ $file -nt $output_base_dir$filedir"/"$filename"."${codec_filetype} ]];
then
	
	if [[ $need_header == "NO" ]];
	then
		printf "${RESTORE}\n"
		need_header="YES"
	fi

	flac_count=$(( flac_count-1 ))
	printf "${LGREY} %5s:  ${CYAN}%s ${RESTORE}\n" $flac_count $filename

	case "${output_codec^^}" in
		"OPUS"	)
			opusenc --quiet --bitrate ${OPUS[$codec_index]} \
				$file $output_base_dir$filedir"/"$filename"."$codec_filetype;;
		"OGG"	)
			oggenc --quality ${OGG[$codec_index]} \
				--quiet $file -o $output_base_dir$filedir"/"$filename"."$codec_filetype;;
		"AAC"	)
			ffmpeg -nostats -loglevel 0 -i "$file" \
				-c:a libfdk_aac -vbr ${AAC[$codec_index]} \
				$output_base_dir$filedir"/"$filename"."$codec_filetype </dev/null;;
		"MP3"	)
			ffmpeg -nostats -loglevel 0 -i "$file" \
				-aq ${MP3[$codec_index]} \
				$output_base_dir$filedir"/"$filename"."$codec_filetype </dev/null;;
	esac

else
	
	if [[ "$filetype" = "flac" ]];
	then
		flac_count=$(( flac_count-1 ))
	fi

	if [[ -d "$file" ]];
	then

		if [[ $need_header == "YES" ]];
		then
			source $SRC/src-tf-terminal-header.sh
		fi

		printf "\e[K${YELLOW}%s ${RESTORE}\r" $file
	
	fi

fi

return