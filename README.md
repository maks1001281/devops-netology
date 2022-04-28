1. Routing entry for 37.192.0.0/16
  Known via "bgp 6447", distance 20, metric 0
  Tag 3267, type external
  Last update from 194.85.40.15 1d05h ago
  Routing Descriptor Blocks:
  * 194.85.40.15, from 194.85.40.15, 1d05h ago
      Route metric is 0, traffic share count is 1
      AS Hops 3
   Route tag 3267
      MPLS label: none
2.	sudo modprobe -v dummy numdummies=2
	sudo ip addr add 10.10.10.10/24 dev dummy0
sudo ip link set dummy0 up  
ip route add  8.8.8.8/32 via  10.10.10.10
root@gitserver:/home/maks# ip route
default via 192.168.1.1 dev eth0 proto dhcp metric 100 
8.8.8.8 via 10.10.10.10 dev dummy0 
10.10.10.0/24 dev dummy0 proto kernel scope link src 10.10.10.10 
54.25.7.14 via 10.10.10.10 dev dummy0 
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.5 metric 100
3. sudo ss -46tlpn
Например ssh 22 порт 
4. sudo ss -upan 
5. По скольку карта сети на работе очень большая и рисовать ее очень долго и домашняя карта тоже не маленькая,
 порядка 20 устройств то вот небольшая граф сводка из zabbix (Смотреть файл Map network)
