1. Почему то сразу в голову приходит дефрагментация диска
2. Нет не могут, жесткая ссылка это ссылка на кусок файловой системы имеющий такие же права как и сам файл.
3. Добавил 2 диска в виртуальную машину с помощью HyperV
4. sdb      8:16   0    3G  0 disk
├─sdb1   8:17   0  500M  0 part
└─sdb2   8:18   0  500M  0 part
5.  sudo sfdisk -d /dev/sdb > sdb.txt 
      sudo sfdisk /dev/sdc < sdb.txt
lsblk :
sdb      8:16   0    3G  0 disk
├─sdb1   8:17   0  500M  0 part
└─sdb2   8:18   0  500M  0 part
sdc      8:32   0    3G  0 disk
├─sdc1   8:33   0  500M  0 part
└─sdc2   8:34   0  500M  0 part
6. sudo mdadm --create  /dev/md1 -l 1 --raid-devices=2 /dev/sdb3 /dev/sdc3
sdb       8:16   0    3G  0 disk
├─sdb1    8:17   0  500M  0 part
├─sdb2    8:18   0  500M  0 part
└─sdb3    8:19   0    2G  0 part
  └─md1   9:1    0    2G  0 raid1
sdc       8:32   0    3G  0 disk
├─sdc1    8:33   0  500M  0 part
├─sdc2    8:34   0  500M  0 part
└─sdc3    8:35   0    2G  0 part
  └─md1   9:1    0    2G  0 raid1
7. sudo mdadm --create  /dev/md0 -l 0 --raid-devices=4 /dev/sdb{1,2} /dev/sdc{1,2}
sdb       8:16   0    3G  0 disk
├─sdb1    8:17   0  500M  0 part
│ └─md0   9:0    0  1.9G  0 raid0
├─sdb2    8:18   0  500M  0 part
│ └─md0   9:0    0  1.9G  0 raid0
└─sdb3    8:19   0    2G  0 part
  └─md1   9:1    0    2G  0 raid1
sdc       8:32   0    3G  0 disk
├─sdc1    8:33   0  500M  0 part
│ └─md0   9:0    0  1.9G  0 raid0
├─sdc2    8:34   0  500M  0 part
│ └─md0   9:0    0  1.9G  0 raid0
└─sdc3    8:35   0    2G  0 part
  └─md1   9:1    0    2G  0 raid1
sr0      11:0    1 1024M  0 rom
8. sudo pvcreate /dev/md0 sudo pvcreate /dev/md1
9. sudo vgcreate md1+md0 /dev/md1 /dev/md0
10.  sudo lvcreate -L 100M -n md100M0 md1+md0 /dev/md0
11. sudo mkfs.ext4 /dev/md1+md0/md100M0
12. sudo mount /dev/md1+md0/md100M0 /tmp/100m
13. Скачал
14. 
sdb                     8:16   0    3G  0 disk
├─sdb1                  8:17   0  500M  0 part
│ └─md0                 9:0    0  1.9G  0 raid0
│   └─md1+md0-md100M0 253:0    0  100M  0 lvm   /tmp/100m
├─sdb2                  8:18   0  500M  0 part
│ └─md0                 9:0    0  1.9G  0 raid0
│   └─md1+md0-md100M0 253:0    0  100M  0 lvm   /tmp/100m
└─sdb3                  8:19   0    2G  0 part
  └─md1                 9:1    0    2G  0 raid1
sdc                     8:32   0    3G  0 disk
├─sdc1                  8:33   0  500M  0 part
│ └─md0                 9:0    0  1.9G  0 raid0
│   └─md1+md0-md100M0 253:0    0  100M  0 lvm   /tmp/100m
├─sdc2                  8:34   0  500M  0 part
│ └─md0                 9:0    0  1.9G  0 raid0
│   └─md1+md0-md100M0 253:0    0  100M  0 lvm   /tmp/100m
└─sdc3                  8:35   0    2G  0 part
  └─md1                 9:1    0    2G  0 raid1
15. Протестировал, файл на месте
16.  sudo pvmove /dev/md0 /dev/md1
17 . sudo mdadm /dev/md1 --fail /dev/sdb3
18. [10429.232296] md/raid1:md1: Disk failure on sdb3, disabling device.
               md/raid1:md1: Operation continuing on 1 devices.
19. Файл доступен
20. У меня всегда сервера работают

