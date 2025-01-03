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

VERSION="1.2.6"
ARTSYNC="YES"
FIGFONT="small"
NUMCPU="$( nproc --all )"

input_flac_dir="$1"
output_lossy_dir="$2"
lossy_codec="${3^^}"
codec_quality="${4^^}"

CBANNER="$BLUE$BOLD"
CNOTICE="$LRED"
CERROR="$RED"
CINFO="$GREEN"
COUNT="$LGRAY"
CHLITE="$CYAN"
CALBUM="$LYELLOW"
CTRACK="$LBLUE"
CPROMPT="$LCYAN$BOLD"
CHOICE="$YELLOW"
CMSG="$YELLOW"
CPERCENT="$BLUE"
CQUESTION="$GREEN"

if [ -f "$HOME/.transflac.conf" ]; then
	source "$SRC/src-tf-conf-override.sh"
fi

return
