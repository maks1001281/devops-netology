1. Linux : ip a, ip show link, ifconfig (sudo apt install net-tools)
Windows : Всегда использую ipconfig /all еще есть netsh interface show interface
2. Ну для начала посылается широковещательный запрос ARP а потом уже все остальное, LLDP не везде включен и устройства
могут ничего о себе не рассказать, используется пакет lldpctl, команда sudo lldpctl
3. VLAN, в своей практики никогда не работал с VLAN хоть и строил большие сети на OSPF и VLAN тестовые , все разделение происходило по маскам,
Пример конфига :
auto eth0.1
iface eth0.1 inet static
address 192.168.0.6
netmask 255.255.255.0
vlan-raw-device eth0
4. mode=0 (balance-rr) mode=1 (active-backup) mode=2 (balance-xor) mode=3 (broadcast) mode=4 (802.3ad) mode=5 (balance-tlb) mode=6 (balance-alb)
Для балансировки используется mode=0 (balance-rr)
Конфиг:
auto bond0
iface bond0 inet dhcp
   bond-slaves eth0 eth0
   bond-mode active-backup
   bond-miimon 100
   bond-primary eth0 eth0
5. Сколько IP адресов в сети с маской /29 ? Ответ: 6
Сколько /29 подсетей можно получить из сети с маской /24 Ответ : 31 (от 0-8 до 248)
6. Есть еще локальный диапазон 100.64.0.0/26
7. arp -a, ip neigh flush all, sudo arp -d 192.168.1.4
8. Установлен cisco packet tracer, там можно наблюдать lldp, vlan

