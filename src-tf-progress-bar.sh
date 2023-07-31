# Copyright © 2017-2019 Gerald B. Cox
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

let tf_progress=(${1}*100/${2}*100)/100
let tf_finish=(${tf_progress}*5)/10
let tf_remains=50-$tf_finish
tf_fill=$(printf "%${tf_finish}s")
tf_void=$(printf "%${tf_remains}s")

printf "${CPERCENT}%s\r" "[${tf_fill// /\#}${tf_void// /-}] $tf_progress%"

if [[ $tf_progress == "100" ]];
then
	printf "${RESTORE}\n"
fi

return
