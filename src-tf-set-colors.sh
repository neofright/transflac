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

RESTORE="\033[0m"

RED="\033[00;31m"
GREEN="\033[00;32m"
YELLOW="\033[00;33m"
BLUE="\033[00;34m"
PURPLE="\033[00;35m"
CYAN="\033[00;36m"
GRAY="\033[00;90m"

LRED="\033[01;31m"
LGREEN="\033[01;32m"
LYELLOW="\033[01;33m"
LBLUE="\033[01;34m"
LPURPLE="\033[01;35m"
LCYAN="\033[01;36m"
LGRAY="\033[00;37m"
WHITE="\033[01;37m"
BLACK="\033[01;30m"

BDEFAULT="\033[01;49m"
BBLACK="\033[01;40m"
BWHITE="\33[01;107M"
BRED="\033[01;41m"
BGREEN="\033[01;42m"
BYELLOW="\033[01;43m"
BBLUE="\033[01;44m"
BPURPLE="\033[01;45m"
BCYAN="\033[01;46m"
BGREY="\033[01;100m"
BLGREY="\033[01;47m"
BLRED="\033[01;101m"
BLGREEN="\033[01;102m"
BLYELLOW="\033[01;103m"
BLBLUE="\033[01;104m"
BLPURPLE="\033[01;105m"
BLCYAN="\033[01;106m"

BOLD="\033[01;1m"
DIM="\033[01;2m"
UNDERLINE="\033[01;4m"
BLINK="\033[01;5m"
REVERSE="\033[01;7m"
HIDDEN="\033[01;8m"

return
