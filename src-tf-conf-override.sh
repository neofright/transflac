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
	"$0"	)
	printf "\nScript must be invoked via source command\nExiting\n"
	exit 1;;
esac

mapfile -t conf_table < "$HOME/.transflac.conf"

for line in "${conf_table[@]}"; do
	line_action=${line%%=*}
	case $line_action in
	"input_flac_dir"	)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		input_flac_dir=$line_var
		;;
	"output_lossy_dir"	)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		output_lossy_dir=$line_var
		;;
	"lossy_codec"		)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		lossy_codec=$line_var
		;;
	"codec_quality"		)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		codec_quality=$line_var
		;;
	"ARTSYNC"		)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		ARTSYNC=$line_var
		;;
	"CNOTICE"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CNOTICE=${term_color[$line_var]}
		fi;;
	"CERROR"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CERROR=${term_color[$line_var]}
		fi;;
	"CINFO"				)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CINFO=${term_color[$line_var]}
		fi;;
	"CHLITE"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CHLITE=${term_color[$line_var]}
		fi;;
	"CALBUM"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CALBUM=${term_color[$line_var]}
		fi;;
	"COUNT"				)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			COUNT=${term_color[$line_var]}
		fi;;
	"CTRACK"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CTRACK=${term_color[$line_var]}
		fi;;
	"CPROMPT"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CPROMPT=${term_color[$line_var]}
		fi;;
	"CHOICE"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CHOICE=${term_color[$line_var]}
		fi;;
	"CMSG"				)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CMSG=${term_color[$line_var]}
		fi;;
	"CPERCENT"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CPERCENT=${term_color[$line_var]}
		fi;;
	"CQUESTION"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CQUESTION=${term_color[$line_var]}
		fi;;
	"CBANNER"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ ${term_color[$line_var]} ]]; then
			CBANNER=${term_color[$line_var]}
		fi;;
	"FIGFONT"			)
		line_var=${line##*=}
		line_var=${line_var%\"}
		line_var=${line_var#\"}
		if [[ -f "/usr/share/figlet/$line_var.flf" ]]; then
			FIGFONT=$line_var
		fi;;
	esac
done

return
