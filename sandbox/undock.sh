#/bin/bash

if [ $# != 1 ]; then echo \nThis script takes only one argument; fi

which udisksctl > /dev/null || echo \nThis system does not have the udisksctl command

for mount_point in $(ls $1); do
	echo $mount_point
done

# udisksctl unmount -b /dev/sdb1
# 
# udisksctl power-off -b /dev/sdb


