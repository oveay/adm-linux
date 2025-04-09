# 1
sudo fdisk /dev/sdb

# 2
sudo blkid /dev/sdb1 | awk -F= '{print $2}' > /root/ex_2_uuid.txt

# 3
mkfs.ext4 -b 4096 /dev/sdb1

# 4
dumpe2fs /dev/sdb1

# 5
tune2fs -c 2 -i 2m /dev/sdb1

# 6
sudo mkdir /mnt/newdisk
sudo mount /dev/sdb1 /mnt/newdisk

# 7
sudo ln -s /mnt/newdisk /root/newdisk_test_7

# 8
mkdir /root/newdisk_test_7/vedsys_1

# 9
nano /etc/fstab 
# add /dev/sdb1 /mnt/newdisk ext4 defaults,noexec,noatime 0 0
reboot
mount

cp /bin/nano /mnt/newdisk/test_nano_bin
/mnt/newdisk/test_nano_bin

# 10
sudo umount /mnt/newdisk/
fdisk /dev/sdb # d + w
fdisk /dev/sdb # n + p +  + +1G + N

e2fsck -f /dev/sdb1
resize2fs /dev/sdb1

mount /dev/sdb1 /mnt/newdisk
df -h /mnt/newdisk

# 11
e2fsck -n /dev/sdb1

# 12
umount /mnt/newdisk
fdisk /dev/sdb

tune2fs -O ^has_journal /dev/sdb1
mke2fs -O journal_dev -b 4096 /dev/sdb2
tune2fs -J device=/dev/sdb2 /dev/sdb1

# 13
fdisk /dev/sdc
fdisk /dev/sdd


sudo apt install lvm2
pvcreate /dev/sdc1 /dev/sdd1
pvdisplay

# 14
vgcreate vg01 /dev/sdd1 /dev/sdc1
vgdisplay

lvcreate -l 100%FREE -n lv01 vg01

mkfs.ext4 /dev/vg01/lv01

# 15
mkdir /mnt/vol01
mount /dev/vg01/lv01 /mnt/vol01

# 16
# already done

# 17
fdisk /dev/sde
pvcreate /dev/sde1
vgextend vg01 /dev/sde1

# 18
lvextend -l +100%FREE /dev/vg01/lv01

# 19
pvdisplay
vgdisplay
lvdisplay

# 20
apt install nfs-kernel-server
systemctl enable nfs-server
systemctl start nfs-server

list-units --type=service | grep running

# 21
nano /etc/exports
# дописать /mnt/vol01 10.0.2.5/24(rw,no_subtree_check)
exportfs -ra
systemctl restart nfs-server

# 22
apt install nfs-common
mkdir /var/remotenfs
mount.nfs -o rw 10.0.2.4:/mnt/vol01 /var/remotenfs

# 23
# add no_root_squash
echo 'vedsys winner' > /var/remotenfs/vedsys_2.txt

# 24
hdparm --fibmap /mnt/vol01/vedsys_2.txt
filefrag -v /mnt/vol01/vedsys.txt
ls -i /mnt/vol01/vedsys.txt

# 25
ls -i
stat
