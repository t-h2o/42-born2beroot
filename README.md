# Born 2 be root

## Objectif

* no graphic interface
* OS debian or CentOS
* AppArmor
* Create two crypt partition
* SSH service on port 4242
* not allow root whit SSH
* use the firewall UFW
* let open only the 4242 port
* the hostname machine is [login]42
* set password rules
	* expiration after 30 days
	* cannot rechange password before 2 days
	* password is 10 caracters, 1 uppercase, 1 digit and no 3 carater follow
	* cannot put the user name in the password
	* just for normal user, need 7 caraters not in the last password 
* install and set sudo with good practice
	* Only 3 try to log whith sudo
	* erro message after a bad try
	* log input and output sudo in /var/log/sudo/
	* mode TTY will be active for security
	* Not allow paths
		* /usr/local/sbin
		* /usr/local/bin
		* /usr/sbin
		* /usr/bin
		* /sbin
		* /bin
		* /snap/bin
* Create script monitoring.sh in bash
	* Every 10 minutes, display on all terminals


## Architecture

In a linux terminal, you can ask with ```uname --all``` system information.
with ```uname -p```, uname will print your processor.
In my case, uname print ```x84_64```. I find what does mean 
[```x84_64```](https://en.wikipedia.org/wiki/X86-64).
x84_64 is a synonyme of AMD64.


## Dowload iso of debian

[Debian](https://www.debian.org/)
, amazing free os...
you can
[download](https://www.debian.org/releases/stable/)
from this page, your architecture version.
In my case, I'll choose the "64-bit PC (amd64)"

Mmm...
Perhaps here for [download](https://www.debian.org/releases/stable/debian-installer/)

## How secure your server...

* remove root user acces via ssh
* hard password
* change port ssh (do not use 22)
* use "fail2ban" servie, he ban ip address using brutforce

## create your VM

1. Download for amd64 : [link](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.2.0-amd64-netinst.iso)
2. (42 school) move the iso in goinfre folder
3. open the program virtual box
4. clic new

```
name : debian-amd64-tgrivel
machine folder : Users/tgrivel/VirtualBox VMs
type : linux
Version : debian (64-bit)
```

5. ram

```
1024 MB
```

6. virtual hard disk

* create virtual hard disk now
* VDI (virtualBox disk image)
* fixed size
* create a folder vm-hd in goinfre
* file location ```/goinfre/tgrivel/vm-hd/debian-amd64.vdi```
* 8 GB

7. you finished to create your VM...

8. select your iso

* setting
* storage
* Empty
* (icon : little cd) 
* choose a disk file

9. network setting

* setting
* attached to : NAT
* advanced
* Port Forwarding
* (icon plus up right)

```
protocole : TCP
host port : 4242
guest port : 42422
```

10. start

## non-free firmware

Sometime you haven't free hardware. In this case you have two choices...

1. use iso with non-free firwmare

2. install like all good.

In case 2, wait the moment who you need the file.
format a usb key in FAT32, then put the file inside.
In the installation <CTRL><ALT><F2>
plug your key

blkid, find the name of your usb key
mount it
```
mkdir mnt/data
mount /dev/sdx1 /mnt/data
mv /mnt/data/path/to/file /lib/firmware
```
return in the installtion
<CTRL><ALT><F1>
OK?

## Install debian

1. Language

```
english
```

2. Location

```
other
europe
switzerland
```

3. configurations locales

```
United states - en_us.UTF-8
```

4. keymap

```
Americain English
```

5. hostname

```
tgrivel42
```

6. domain name

```
<empty>
```

7. root password

```
<rootPassWord>
```

8. Full name user

```
Theo Grivel
```

9. user name

```
tgrivel
```

10. user password

```
<userPassWord>
```

11. Partitions Disk

```
Manual

129M
Ext2
/boot

max
LVM

encrypt /dev/sda2

configure lvm
create volume "LVMGroup"
/dev/mapper/sda2_crypt

8M
[SWAP]

srv
8M
/srv

home
8M
/home

tmp
8M
/tmp

var
257M
/var

var-log
258M
/var/log

root
max 
/
```

12. Select disk

```
8.6 GB
yes
```

13. partions

* create 2 partitions
	* boot
	* other
encrypt the other
setting the logical

14. a


## Setting Debian

1. login with root user

2. download my repo

```
apt install git
git clone https://github.com/theo-grivel/42-born2beroot
cd autoconfig
nano run.sh # change value like name user...
./run.sh
```

## Finish

1. shutdown your vm

2. clic on icon 3 sticks of your vm

3. selection snapchots

4. clic on take (icon +)

and give a name of your snapchot

5. shasum vm.vdi
