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

declare -A quality_opus
quality_opus["LOW"]="48"
quality_opus["MEDIUM"]="64"
quality_opus["STANDARD"]="96"
quality_opus["HIGH"]="128"
quality_opus["PREMIUM"]="192"

declare -A quality_ogg
quality_ogg["LOW"]="1"
quality_ogg["MEDIUM"]="2"
quality_ogg["STANDARD"]="3"
quality_ogg["HIGH"]="4"
quality_ogg["PREMIUM"]="5"

declare -A quality_aac
quality_aac["LOW"]="1"
quality_aac["MEDIUM"]="2"
quality_aac["STANDARD"]="3"
quality_aac["HIGH"]="4"
quality_aac["PREMIUM"]="5"

declare -A quality_mp3
quality_mp3["LOW"]="8"
quality_mp3["MEDIUM"]="7"
quality_mp3["STANDARD"]="6"
quality_mp3["HIGH"]="5"
quality_mp3["PREMIUM"]="4"

declare -A codec_filetype
codec_filetype["OPUS"]="opus"
codec_filetype["OGG"]="ogg"
codec_filetype["AAC"]="m4a"
codec_filetype["MP3"]="mp3"

declare -A process_name
process_name["OPUS"]="opusenc"
process_name["OGG"]="oggenc"
process_name["AAC"]="ffmpeg"
process_name["MP3"]="ffmpeg"

return
