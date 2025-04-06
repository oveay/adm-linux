
output="work3.log"

# number 1
printf 'users and ids\n' > $output
awk -F: '{print "user", $1, "has id", $3}' /etc/passwd >> $output

# number 2
printf '\nroot password change info\n' >> work3.log
sudo chage -l root | grep 'Last password change' | awk -F': ' '{print $2}' >> $output

# number 3
printf '\ngroups info\n' >> $output
groups | tr ' ' ',' >> $output

# number 4
sudo touch /etc/skel/readme.txt
sudo chmod 700 -R /etc/skel
sudo chown $USER -R /etc/skel
sudo echo "Be careful!" > "/etc/skel/readme.txt"

# number 5
sudo useradd u1 -p "$(openssl passwd -1 12345678)" -m

# number 6
sudo groupadd g1

# number 7
sudo usermod -a -G g1 u1

# number 8
printf '\nu1 info\n' >> $output
id u1 >> $output

# number 9
sudo usermod -a -G g1 $USER

# number 10
printf '\ng1 users info\n' >> $output
cat /etc/group | grep 'g1' | awk -F: '{print $4}'  >> $output

# number 11
sudo chown u1 /home/u1
sudo usermod -s /usr/bin/mc u1

# number 12
sudo useradd u2 -p "$(openssl passwd -1 87654321)" -m

# number 13
sudo mkdir /home/test13
sudo cp work3.log /home/test13/work3-1.log
sudo cp work3.log /home/test13/work3-2.log

# number 14
sudo groupadd group_test_13
sudo usermod -aG group_test_13 u1
sudo usermod -aG group_test_13 u2

sudo chgrp -R group_test_13 /home/test13
sudo chown -R u1 /home/test13

sudo chmod -R 640 /home/test13
sudo chmod 750 /home/test13

# number 15
sudo mkdir /home/test14
sudo chown u1:u1 /home/test14
sudo chmod 1777 /home/test14

# number 16
sudo cp /usr/bin/nano /home/test14/nano
sudo chown u1:u1 /home/test14/nano
sudo chmod u+s /home/test14/nano

# number 17
sudo mkdir /home/test_15
sudo chown -R $USER /home/test_15
sudo echo 'secret info' > /home/test_15/secret_file

sudo chmod 444 -R /home/test_15
sudo chmod 111 /home/test_15

# number 18
# visudo + дописать:
# u1 ALL=(root) /usr/bin/passwd

