# 1
nano /etc/apt/sources.list
apt-cache policy

# 2
apt update

# 3
apt show build-essential

# 4
apt-get install build-essential --no-act
apt-get install build-essential --yes

# 5
apt search 'clone with a bastard algorithm'

# 6
apt source bastet/stable

# 7
apt install libboost-dev --yes
sudo apt-get install libncurses-dev --yes
sudo apt-get install libboost-program-options-dev --yes

make
sudo make install

# 8
nano Makefile
# add install:
#        install -m 755 bastet.6 /usr/local/bin/bastet
sudo make install
ls -l /usr/local/bin/bastet 

# 9
/usr/local/bin/bastet

# 10
apt list --installed > task10.log

# 11
apt show gcc | grep 'Depends' > task11.log
cat task11.log

# 12
apt-cache rdepends libgpm2 > task12.log
cat task12.log

# 13
mkdir localrepo
cd localrepo/

wget https://snapshot.debian.org/archive/debian-ports/20250408T140348Z/pool-alpha/main/h/htop/htop_3.4.0-5_alpha.deb
wget https://snapshot.debian.org/archive/debian-ports/20250408T140348Z/pool-alpha/main/h/htop/htop_3.4.0-3_alpha.deb
wget https://snapshot.debian.org/archive/debian-ports/20250408T140348Z/pool-alpha/main/h/htop/htop_3.4.0-2_alpha.deb
wget https://snapshot.debian.org/archive/debian-ports/20250209T195424Z/pool-alpha/main/h/htop/htop_3.3.0-5_alpha.deb
wget https://snapshot.debian.org/archive/debian-ports/20250209T195424Z/pool-alpha/main/h/htop/htop_3.3.0-4_alpha.deb

# 14
dpkg-scanpackages --multiversion . > Packages
nano Release

# 15
nano /etc/apt/sources.list.d/localrepo.list
# add deb [trusted=yes] file:///root/localrepo myrepo main
apt update
wget https://snapshot.debian.org/archive/debian/20240129T091021Z/pool/main/h/htop/htop_3.3.0-4_arm64.deb
wget https://snapshot.debian.org/archive/debian/20250408T090504Z/pool/main/h/htop/htop_3.4.0-5_arm64.deb
wget https://snapshot.debian.org/archive/debian/20250408T090504Z/pool/main/h/htop/htop_3.4.0-3_arm64.deb
wget https://snapshot.debian.org/archive/debian/20250408T090504Z/pool/main/h/htop/htop_3.4.0-2_arm64.deb
wget https://snapshot.debian.org/archive/debian/20250310T101857Z/pool/main/h/htop/htop_3.4.0-1_arm64.deb

nano /etc/apt/sources.list.d/localrepo.list
# add deb [trusted=yes] file:///root/localrepo ./
sudo apt update


# 16
apt policy

# 17
apt policy htop > task16.log

# 18
sudo apt install htop=3.3.0-4 --yes

# 19
apt download nano
dpkg-deb -R nano_7.2-1+deb12u1_arm64.deb ./task19
nano task19/DEBIAN/postinst
# add ln -s /usr/bin/nano /usr/bin/newnano
sudo dpkg-deb --build task19/ task19/task_build.deb
sudo dpkg -i task19/task_build.deb
newnano

