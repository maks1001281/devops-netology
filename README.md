1. strace /bin/bash -c 'cd /tmp' 2>&1&>log.txt перенаправим вывод в файл
cat log.txt | grep /tmp решил посмотреть grep что есть в файле на счет tmp,
погуглив нашел что вызов chdir("/tmp") изменяет рабочий каталог
execve("/bin/bash", ["/bin/bash", "-c", "cd /tmp"], 0x7ffe12a23530 /* 21 vars */) = 0
stat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=4096, ...}) = 0
chdir("/tmp")                           = 0
2. Openat   открытие /etc/magic.mgc
3. Например можно запустить strace c ключем -p что бы сделать траблшут уже на рабочем процессе и понять куда пишется этот лог что бы самостоятельно удалить его или почистить, или можно попробовать перенаправить данные из файла log в файл dlog, что то типа /log >> /dlog
4. Wiki говорит что не занимает: Процесс при завершении (как нормальном, так и в результате не обрабатываемого сигнала) освобождает все свои ресурсы и становится «зомби» — пустой записью в таблице процессов, хранящей статус завершения, предназначенный для чтения родительским процессом.
Но на некоторых форумах пишут что если таких процессов слишком много они могут уже приводит к проблемам, кому верить не знаю.
5. При запуске ./opensnoop-bpfcc получаю ошибку
sh: 1: modprobe: not found
Unable to find kernel headers. Try rebuilding kernel with CONFIG_IKHEADERS=m (module) or installing the kernel development package for your running kernel version.
chdir(/lib/modules/5.10.0-11-amd64/build): No such file or directory
Traceback (most recent call last):
  File "/usr/sbin/./opensnoop-bpfcc", line 261, in <module>
    b = BPF(text='')
  File "/usr/lib/python3/dist-packages/bcc/__init__.py", line 364, in __init__
    raise Exception("Failed to compile BPF module %s" % (src_file or "<text>"))
Exception: Failed to compile BPF module <text>
6. uname (1)            - print system information 
Выел man в txt и сделал cat man.txt | grep -i version
These files give substrings of /proc/version.
              meaning that every possible SysRq request is allowed (in older kernel versions, SysRq was disabled  by  de‐
       /proc/sys/kernel/version
                  Timer Stats Version: v0.3
       /proc/version
              This string identifies the kernel  version  that  is  currently  running.   It  includes  the  contents  of
              /proc/sys/kernel/ostype, /proc/sys/kernel/osrelease, and /proc/sys/kernel/version.
cat /proc/version
Linux version 5.10.0-11-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.92-2 (2022-02-28)
7. [Точка-с-запятой] Позволяет записывать две и более команд в одной строке.
&& является логическим «И» и выполнит вторую часть оператора только в том случае, если первая часть верна
 ключ -e значит Выйти немедленно, если команда завершается с ненулевым статусом, смысл использовать && есть тк если  будет нулевой результат то выполнение продолжится 
8. -e Немедленный выход, если команда завершается с ненулевым статусом.
-u прекращает выполнение скрипта, если встретилась несуществующая переменная
-x Печатать команды и их аргументы по мере их выполнения.
-o имя-опции
Его хорошо бы было использовать в сценариях потому что если скрипт совершится с ошибкой то мы все увидим на экране, и будет видно на каком этапе ошибка выполнения 
9. ps -o stat
STAT
Ss
R+
S    interruptible sleep (waiting for an event to complete)
s    is a session leader
R    running or runnable (on run queue)
+    is in the foreground process group


