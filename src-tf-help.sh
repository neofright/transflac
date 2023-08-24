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

printf "%s\n" "This is transflac v$VERSION" \
" " \
"USAGE: transflac [input_flac_directory] [output_lossy_directory] [lossy_codec] [codec_quality]" \
"       transflac quit     - Immediately exit" \
"       transflac exit     - Immediately exit" \
"       transflac -h       - Display HELP" \
"       transflac --help   - Display HELP" \
" " \
"EXAMPLES" \
"       Possible ways one can call transflac:" \
" " \
"       transflac" \
"              You will be prompted to enter all options." \
"              If you have customized options in "$HOME"/.transflac.conf" \
"              those values will be substituted." \
" " \
"       transflac [input_flac_directory] [output_lossy_directory] [lossy_codec] [codec_quality]" \
"              transflac processing will proceed with the options entered on the command line."
return
