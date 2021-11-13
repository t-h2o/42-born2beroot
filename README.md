# Born 2 be root

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

## Parted a disk

In a terminal, we will use few tool to part a disk...

### lsblk

lsblk (list block), he list informations about
disk and partition


### parted

this program manipulate disk partitions.


```:~$ parted /dev/sda1```

```(parted) print``` to print disk partitions

```(parted) help``` to print main command


### mkfs

mkfs (make file system)

```:~$ mkfs -t ext4 /dev/sda1```


### mount

To mount a partition,

```:~$ mount /dev/sda1 /media/dir_u_want```

To umount a partition,

```:~$ umount /dev/sda```


### step to partitions...

1. ```:~$ lsblk```

output :

```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
fd0      2:0    1     4K  0 disk
loop0    7:0    0   1.8G  1 loop /rofs
sda      8:0    0 298.1G  0 disk
└─sda1   8:1    0  23.3G  0 part /media/winpol
sdb      8:16   0  74.5G  0 disk
└─sdb1   8:17   0  74.5G  0 part /media/pol
sdc      8:32   1  14.3G  0 disk /cdrom
└─sdc1   8:33   1   1.9G  0 part
```

2. ```:~$ parted /dev/sda```


```
(parted) print                                                           
Model: ATA SAMSUNG HD321KJ (scsi)
Disk /dev/sda: 320GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start   End     Size    Type     File system  Flags
1      1049kB  25.0GB  25.0GB  primary  ext4

(parted) mkpart                                                          
Partition type?  primary/extended? extended                              
Start? 25.1GB                                                            
End? 50GB                                                                
(parted) print                                                           
Model: ATA SAMSUNG HD321KJ (scsi)
Disk /dev/sda: 320GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start   End     Size    Type      File system  Flags
1      1049kB  25.0GB  25.0GB  primary   ext4
2      25.0GB  50.0GB  25.0GB  extended               lba

(parted) quit
```

3. ```:~$ mkfs -t ext4 /dev/sda2```

4. ```:~$ mount /dev/sda1 /media/dir_u_want```
