#! /bin/bash

SCRIPT_DIR=/etc/init.d/
SCRIPT=$1
CASE=$2
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
FILE=$DIR"/"$SCRIPT

#puts the script in int.d
function copy() {
        echo "Stored file $SCRIPT in $SCRIPT_DIR "
        sudo cp $FILE $SCRIPT_DIR 
}

#Delets the script from int.d
function delete(){
	echo "Deleting $SCRIPT in $SCRIPT_DIR"
	sudo rm $SCRIPT_DIR$SCRIPT 
}

function main(){
	case $CASE in
		"start")
		copy
		;;
		"stop")
		delete
		;;
		*)
		echo "Wrong Argument use start/stop"
		;;
		esac
}


if [ "$(file --mime-type -b "$FILE")" == "text/x-shellscript" ]
then
    main
else
    echo "Not a Script"
fi
