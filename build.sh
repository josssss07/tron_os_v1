sudo su

docker run --privileged -it ubuntu
apt update
apt-get install bzip2 git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools

git clone --depth 1 https://github.com/torvalds/linux.git

cd linux

make menuconfig
#enter any specific build options you need for your kernel build 

make -j $(nproc)
#assigns all cores to building the kernel

mkdir /boot-files
cp /arch/x86/boot/bzImage /boot-files/
cd ..
git clone --depth 1 https://git.busybox.net/busybox
cd busybox
make menuconfig
#in the make menu configure the build file to be one single static binary as it will reduce the install size

make -j $(nproc)
mkdir /boot-files/initramfs
make CONFIG_PREFIX=/boot-files/initramfs/
cd ..
cd  /boot-files/initramfs

# in boot files, enter vim and type:
# !/bin/sh
#/bin/sh


rm linuxrc

chmod +x init

find . | cpio -o -H newc > ../init.cpio

cd ..

apt install syslinux 
#already installed but just for redundancy

dd if=/dev/zero of=boot bs=1M count=50

mkfs -t fat boot
syslinux boot
mkdir m

mount boot m 
cp bzImage init.cpio m 
unmount m



#once these steps are complted, copy the docker image w this commands

cp $(docker_image_file_number):/boot-files/boot

quemu-system-x86_64 boot



#once system is booted, mount the boot(bzimage) file
/bzImage -inirtd=./init.cpio

#this will take you to a working tron_os shell
#type exit to quit the shell

