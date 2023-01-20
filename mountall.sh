#!/usr/bin/env bash
cd "$(dirname "$(realpath "${BASH_SOURCE[0]:-$0}")")"

for n in $(lsblk -dPnib -o NAME,MOUNTPOINT,SIZE,UUID|grep -v UUID=\"\"|grep MOUNTPOINT=\"\"|cut -d " " -f 1|sed -r s/NAME=\"\//g|sed s/\"//)
do
    echo "Working on $n file name now"
    rmdir "/mnt/$n"
    mkdir "/mnt/$n"
    mount "/dev/$n" "/mnt/$n"
done

args=$(ls -C /mnt/*/mine.me| sed s/mine.me\ /\ -d/g| sed s/mine.me//)
args="-a xch1s77znzah4v2xr854z7demph9vg434vm67gy06nt2fcyej67e83fqj7qsys -d $args -c 5"
./client $args
