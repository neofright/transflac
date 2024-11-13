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

need_header="NO"

source $SRC/src-tf-figlet.sh

printf "${CNOTICE}%s${CINFO}%s${CHOICE}%s\n" "INPUT " " Directory " "$rp_input_flac_dir"
printf "${CNOTICE}%s${CINFO}%s${CHOICE}%s\n" "OUTPUT" " Directory " "$rp_output_lossy_dir"
printf "${CNOTICE}%s${CHOICE}%s\n" "Transcoding: " "FLAC to $LOSSY_CODEC"
printf "${CNOTICE}%s${CHOICE}%s\n\n" "Quality Setting: " "$CODEC_QUALITY"
printf "${CHLITE}%s${COUNT}%s${CINFO}%s${CHLITE}%s${RESTORE}\n\n" "***" " $total_flac " "FLAC files are being processed " "***"

return
