# Copyright © 2023 Gerald B. Cox
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
	exit 1;;
esac

mapfile -t conf_table < "$HOME/.transflac.conf"

for line in "${conf_table[@]}"; do
	line_action=${line%%=*}
	case $line_action in
	"input_flac_dir"         )
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${line_var} =~ $ck_index ]]; then
			input_flac_dir=$line_var
		fi;;
	"output_lossy_dir"       )
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${line_var} =~ $ck_index ]]; then
			output_lossy_dir=$line_var
		fi;;
	"lossy_codec"       )
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${line_var} =~ $ck_index ]]; then
			lossy_codec=$line_var
		fi;;
	"codec_quality"       )
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${line_var} =~ $ck_index ]]; then
			codec_quality=$line_var
		fi;;
	"FIGFONT"       )
		line_var=${line##*=}
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ -f "/usr/share/figlet/$line_var.flf" ]]; then
			FIGFONT=$line_var
		fi;;
	esac
done

return
