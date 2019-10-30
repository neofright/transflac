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

if [[ "$filetype" = "flac" ]] && [[ $file -nt $rp_output_lossy_dir$filedir"/"$filename"."${codec_filetype[$LOSSY_CODEC]} ]];
then
	
	if [[ $need_header == "NO" ]];
	then
		printf "${RESTORE}\n"
		need_header="YES"
	fi

	flac_count=$(( flac_count-1 ))
	printf "${LGREY} %5s:  ${CYAN}%s ${RESTORE}\n" $flac_count $filename

	while [[ $( pgrep -c ${process_name[$LOSSY_CODEC]} ) -ge $NUMCPU ]];
	do
		sleep 1s
	done

	case "$LOSSY_CODEC" in
		"OPUS"	)
			opusenc --quiet --bitrate ${quality_opus[$CODEC_QUALITY]} \
				$file $rp_output_lossy_dir$filedir"/"$filename"."${codec_filetype[$LOSSY_CODEC]} &;;
		"OGG"	)
			oggenc --quality ${quality_ogg[$CODEC_QUALITY]} \
				--quiet $file -o $rp_output_lossy_dir$filedir"/"$filename"."${codec_filetype[$LOSSY_CODEC]} &;;
		"AAC"	)
			ffmpeg -nostats -loglevel 0 -i $file \
				-c:a libfdk_aac -vbr ${quality_aac[$CODEC_QUALITY]} \
				$rp_output_lossy_dir$filedir"/"$filename"."${codec_filetype[$LOSSY_CODEC]} </dev/null &;;
		"MP3"	)
			ffmpeg -nostats -loglevel 0 -i $file \
				-aq ${quality_mp3[$CODEC_QUALITY]} \
				$rp_output_lossy_dir$filedir"/"$filename"."${codec_filetype[$LOSSY_CODEC]} </dev/null &;;
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
