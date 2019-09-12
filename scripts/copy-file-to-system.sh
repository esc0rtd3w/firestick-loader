#!/system/bin/sh

temp="$1"
dest="$2"
perm_dir="$3"
perm_file="$4"
user="$5"

case "$temp" in

"")
	echo "$temp Not Defined Exiting..."
	exit
;;

*)
	echo "Copying $temp to $dest..."
	
	mount -o rw,remount /system

	rm $dest
	#mkdir $dest
	chmod $perm_dir $dest

	cp $temp $dest

	chown $user:$user $dest
	chmod $perm_file $dest
;;

esac
