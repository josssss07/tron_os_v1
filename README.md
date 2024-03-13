# Tron os v1
<br>

A minimal install of linux that has a working filesystem with initramfs and a busybox image for core utils
>

This project is a demonstaration to see and understand how the linux kerenl works under the hood and see how different kernel settings will affect the performance along with the working of different systems in linux

The main objective is to see if it is possible to create another distro of linux based on a custom build of the linux kernel along with a custom DE.

This project was built inspired by Nir Lichtman and his series on youtube for low level development

It was built using https://github.com/torvalds/linux.git , https://git.busybox.net/busybox, docker and quemu(for dispaying a working virtual machine)

The iso for this custom built kernel was done in an ubuntu docker image. It has only the most basic tools in the image in order to keep it running as fast and smooth as possible while having a minimal impact. Tron os can be run on Arduino as the final image is 52mb. 
Instructions on how to build tron os is in the build.sh file. This is not a scrpt you must manually enter the commands in a docker container