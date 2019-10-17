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

need_header="NO"

source $SRC/src_tf_figlet.sh

printf "${RED}%s${GREEN}%s${YELLOW}%s\n" "INPUT " " Directory " "$input_base_dir"
printf "${RED}%s${GREEN}%s${YELLOW}%s\n" "OUTPUT" " Directory " "$output_base_dir"
printf "${PURPLE}%s\n\n" "Transcoding from FLAC to ${output_codec^^}"
printf "${LBLUE}%s${LGRAY}%s${GREEN}%s${LBLUE}%s${RESTORE}\n\n" "***" " $total_flac " "FLAC files are being processed " "***"

return