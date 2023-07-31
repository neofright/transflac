# Copyright © 2022 Gerald B. Cox
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
	printf "%sScript must be invoked via source command\n"
	printf "%sExiting\n"
	exit 1;;
esac

RESTORE="\033[0m"
DEFAULT="\033[0m"

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
CLRLINE="\e[K"

declare -A term_color
term_color["DEFAULT"]="\033[0m"
term_color["RESTORE"]="\033[0m"
term_color["RED"]="\033[00;31m"
term_color["GREEN"]="\033[00;32m"
term_color["YELLOW"]="\033[00;33m"
term_color["BLUE"]="\033[00;34m"
term_color["PURPLE"]="\033[00;35m"
term_color["CYAN"]="\033[00;36m"
term_color["GRAY"]="\033[00;90m"
term_color["LRED"]="\033[01;31m"
term_color["LGREEN"]="\033[01;32m"
term_color["LYELLOW"]="\033[01;33m"
term_color["LBLUE"]="\033[01;34m"
term_color["LPURPLE"]="\033[01;35m"
term_color["LCYAN"]="\033[01;36m"
term_color["LGRAY"]="\033[00;37m"
term_color["WHITE"]="\033[01;37m"
term_color["BLACK"]="\033[01;30m"
term_color["BDEFAULT"]="\033[01;49m"
term_color["BBLACK"]="\033[01;40m"
term_color["BWHITE"]="\33[01;107M"
term_color["BRED"]="\033[01;41m"
term_color["BGREEN"]="\033[01;42m"
term_color["BYELLOW"]="\033[01;43m"
term_color["BBLUE"]="\033[01;44m"
term_color["BPURPLE"]="\033[01;45m"
term_color["BCYAN"]="\033[01;46m"
term_color["BGREY"]="\033[01;100m"
term_color["BLGREY"]="\033[01;47m"
term_color["BLRED"]="\033[01;101m"
term_color["BLGREEN"]="\033[01;102m"
term_color["BLYELLOW"]="\033[01;103m"
term_color["BLBLUE"]="\033[01;104m"
term_color["BLPURPLE"]="\033[01;105m"
term_color["BLCYAN"]="\033[01;106m"
term_color["BOLD"]="\033[01;1m"
term_color["DIM"]="\033[01;2m"
term_color["UNDERLINE"]="\033[01;4m"
term_color["BLINK"]="\033[01;5m"
term_color["REVERSE"]="\033[01;7m"
term_color["HIDDEN"]="\033[01;8m"
term_color["CLRLINE"]="\e[K"

return
