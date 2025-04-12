# 1
systemd-analyze time

# 2
systemd-analyze blame > lab_4/blame.txt
cat lab_4/blame.txt

# 3
systemd-analyze critical-chain sshd.service

# 4
systemd-analyze plot > /home/vboxuser/plot.svg

# ---------------------------------------------------------------

# 1
systemctl list-units
systemctl list-units --state=running | grep '.service'

# 2
systemctl list-unit-files --state=enabled | grep .service

# 3
systemctl list-dependencies sshd.service

# 4
systemctl status cron.service

# 5
systemctl show cron

# 6
systemctl disable cron

# ---------------------------------------------------------------

# 1
nano  /etc/systemd/system/mymsg.service

# add
# [Unit]
# Description=vedsys mymsg test
# After=network.target

# [Service]
# Type=simple
# ExecStart=/usr/bin/logger "mymsg service started at $(date)"

# [Install]
# WantedBy=multi-user.target


# 2
systemctl enable mymsg.service

# 3
systemctl start mymsg.serviceq


# ---------------------------------------------------------------

# 1
journalctl | grep 'mymsg'
journalctl

# 2
journalctl | grep 'mymsg'

# 3
journalctl --priority=err

# 4
journalctl --disk-usage

# ---------------------------------------------------------------

# 1
fdisk /dev/sdb
mkfs.ext4 /dev/sdb3
mkdir /mnt/mydata

# 2
nano /etc/systemd/system/mnt-mydata.mount
# add                                                                                                         
# [Unit]
# Description=vedsys test mount

# [Mount]
# What=/dev/sdb3
# Where=/mnt/mydata     
# Type=ext4
# Options=defaults

# [Install]
# WantedBy=multi-user.target

# 3
systemctl enable mnt-mydata.mount
systemctl start mnt-mydata.mount
journalctl -xe
lsblk

# ---------------------------------------------------------------

# 1
systemctl stop mnt-mydata.mount
lsblk

# 2
nano /etc/systemd/system/mnt-mydata.automount

# add
# [Unit]
# Description=vedsys automount test 

# [Automount]
# What=/dev/sdb3
# Where=/mnt/mydata     
# TimeoutIdleSec=15

# [Install]
# WantedBy=multi-user.target


# 3
systemctl enable mnt-mydata.automount
systemctl start mnt-mydata.automount
lbslk
ls /mnt/mydata/
lsblk
