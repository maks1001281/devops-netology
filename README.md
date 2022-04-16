1.В автозагрузку поместил, за это отвечает опция WantedBy=multi-user.target в блоке [install],
предусмотрите возможность добавления опций к запускаемому процессу через внешний файл: это как? Я и так создай node_exporter.service, служба корректно стартует, перезапускается, останавливается.
2.
--collector.filesystem
--collector.meminfo 
--collector.cpu
--collector.netdev
Я бы выбрал эти но они и так по умолчанию включены 
3.Установил, приятный веб интерфейс с множеством полезных метрик
4.Можно это понять:
[    0.000000] Hypervisor detected: Microsoft Hyper-V
[    0.000000] clocksource: hyperv_clocksource_tsc_page: mask: 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
[    0.042782] SRBDS: Unknown: Dependent on hypervisor status
[    0.164107] clocksource: Switched to clocksource hyperv_clocksource_tsc_page
[    0.788610] hv_vmbus: registering driver hid_hyperv
[    2.426157] hv_vmbus: registering driver hyperv_fb
[    2.426464] hyperv_fb: Synthvid Version major 3, minor 5
[    2.426491] hyperv_fb: Screen resolution: 1024x768, Color depth: 32
[    2.426493] hyperv_fb: Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.
[    2.428396] hv_vmbus: registering driver hyperv_keyboard
[    2.431115] hv_utils: Registering HyperV Utility Driver
5.Максимальное значение дескрипторов 1048576, Ulimit ограничивает ресурсы на текущую сессию, Ulimit -n наприер 2048
6 
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0   5304   572 pts/4    S+   08:53   0:00 sleep 1h
7.Эта команда является логической бомбой. Она оперирует определением функции с именем ‘:‘, которая вызывает сама себя дважды: один раз на переднем плане и один раз в фоне. Она продолжает своё выполнение снова и снова, пока система не зависнет.
Никакой стабилизации не произошло, при вводе любой команды выдавало bash: fork: retry: Resource temporarily unavailable

