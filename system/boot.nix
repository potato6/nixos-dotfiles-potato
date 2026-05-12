{ config, ... }:
{

  boot = {

    # Initrd Settings - stage 1 boot
    loader = {
      systemd-boot = {
        enable = true; # Enable systemd-boot for EFI systems
        editor = false; # allow editing the kernel command-line before boot.
      };
      timeout = 5; # timeout (in seconds) until loader boots the default menu item
    };

    kernelParams = [
      "lru_gen.enabled=y" # MGLRU
      "split_lock_detect=off"
      "processor.ignore_ppc=1"
      "tsc=reliable"
      "clocksource=tsc"
      "nowatchdog"
      "nmi_watchdog=0"
      "microcode.amd_sha_check=off" # ucodenix requires this
    ];

    kernel.sysctl = {

      "kernel.numa_balancing" = 1;

      # The sysctl swappiness parameter determines the kernel's preference for pushing anonymous pages or page cache to disk in memory-starved situations.
      # A low value causes the kernel to prefer freeing up open files (page cache), a high value causes the kernel to try to use swap space,
      # and a value of 100 means IO cost is assumed to be equal.
      "vm.swappiness" = 100;

      # The value controls the tendency of the kernel to reclaim the memory which is used for caching of directory and inode objects (VFS cache).
      # Lowering it from the default value of 100 makes the kernel less inclined to reclaim VFS cache (do not set it to 0, this may produce out-of-memory conditions)
      "vm.vfs_cache_pressure" = 50;

      # Contains, as bytes, the number of pages at which a process which is
      # generating disk writes will itself start writing out dirty data.
      "vm.dirty_bytes" = 268435456;
      "vm.dirty_background_ratio" = 5;
      "vm.dirty_ratio" = 10;

      # Reserves minimum amount of free memory for system operations.
      # (typically 0.5-1% of total RAM)
      "vm.min_free_kbytes" = 131072; # 128 MB

      # page-cluster controls the number of pages up to which consecutive pages are read in from swap in a single attempt.
      # This is the swap counterpart to page cache readahead. The mentioned consecutivity is not in terms of virtual/physical addresses,
      # but consecutive on swap space - that means they were swapped out together. (Default is 3)
      # increase this value to 1 or 2 if you are using physical swap (1 if ssd, 2 if hdd)
      "vm.page-cluster" = 0;

      # Contains, as bytes, the number of pages at which the background kernel
      # flusher threads will start writing out dirty data.
      "vm.dirty_background_bytes" = 67108864;

      # The kernel flusher threads will periodically wake up and write old data out to disk.  This
      # tunable expresses the interval between those wakeups, in 100'ths of a second (Default is 500).
      "vm.dirty_writeback_centisecs" = 1500;

      # This action will speed up your boot and shutdown, because one less module is loaded. Additionally disabling watchdog timers increases performance and lowers power consumption
      # Disable NMI watchdog
      "kernel.nmi_watchdog" = 0;

      # Restricting access to kernel pointers in the proc filesystem
      "kernel.kptr_restrict" = 2;

      "kernel.pid_max" = 4194304;
      "kernel.sched_migration_cost_ns" = 5000000;

      # Fix for some modded games that open too many files
      "vm.max_map_count" = 2147483642;
      "fs.file-max" = 524288;

      # Optimize for many small files
      "fs.aio-max-nr" = 1048576;

      "fs.inotify.max_user_watches" = 524288;
      "kernel.panic" = 10;
      "kernel.panic_on_oops" = 1;

      # Enable TCP Fast Open
      "net.ipv4.tcp_fastopen" = 3;

      # Enable MTU probing
      "net.ipv4.tcp_mtu_probing" = 1;

      # TCP BBR congestion control (Requires 'tcp_bbr' module)
      "net.core.default_qdisc" = "cake";
      "net.ipv4.tcp_congestion_control" = "bbr";

      "net.ipv4.conf.all.rp_filter" = 1; # Strict reverse path filtering
      "net.ipv4.conf.default.rp_filter" = 1; # Strict reverse path filtering
      "net.ipv4.conf.all.accept_redirects" = 0; # Disable ICMP redirects
      "net.ipv4.conf.default.accept_redirects" = 0; # Disable ICMP redirects
      "net.ipv4.conf.all.secure_redirects" = 0; # Disable secure redirects
      "net.ipv4.conf.default.secure_redirects" = 0; # Disable secure redirects
      "net.ipv6.conf.all.accept_redirects" = 0; # Disable IPv6 redirects
      "net.ipv6.conf.default.accept_redirects" = 0; # Disable IPv6 redirects
      "net.ipv4.conf.all.send_redirects" = 0; # Disable sending redirects
      "net.ipv4.conf.default.send_redirects" = 0; # Disable sending redirects
      "net.ipv4.icmp_echo_ignore_all" = 1; # Ignore ICMP echo requests
      "net.ipv6.icmp.echo_ignore_all" = 1; # Ignore IPv6 ICMP echo requests
      "net.ipv6.conf.all.accept_ra" = 0; # Disable router advertisements
      "net.ipv6.conf.default.accept_ra" = 0; # Disable router advertisements
      "net.ipv4.tcp_rfc1337" = 1; # Mitigate TIME-WAIT assassination
      "net.ipv4.tcp_keepalive_time" = 600;
      "net.ipv4.tcp_keepalive_probes" = 5;
      "net.ipv4.tcp_keepalive_intvl" = 60;
      "net.ipv4.tcp_max_tw_buckets" = 400000;
      "net.ipv4.tcp_window_scaling" = 1;
      "net.ipv4.tcp_sack" = 1;
      "net.core.rmem_max" = 134217728;
      "net.core.wmem_max" = 134217728;
      "net.core.rmem_default" = 65536; # 64 KB
      "net.core.wmem_default" = 65536; # 64 KB
      "net.ipv4.tcp_rmem" = "4096 87380 67108864"; # min default max
      "net.ipv4.tcp_wmem" = "4096 65536 67108864"; # min default max
      # Increase connection backlog
      "net.core.somaxconn" = 65535;
      "net.core.netdev_max_backlog" = 65536;
      "net.ipv4.tcp_max_syn_backlog" = 8192;
      "net.ipv4.tcp_syncookies" = 1;
      "net.ipv4.tcp_base_mss" = 536;

      # Enable TCP timestamps
      "net.ipv4.tcp_timestamps" = 1;

      # Reduce TIME_WAIT connections
      "net.ipv4.tcp_fin_timeout" = 15;
      "net.ipv4.tcp_tw_reuse" = 1;
    };
  };

  services.udev.extraRules = ''

        # HDD
    ACTION=="add|change", KERNEL=="sd[a-z]*", ATTR{queue/rotational}=="1", \
        ATTR{queue/scheduler}="bfq"

    # SSD
    ACTION=="add|change", KERNEL=="sd[a-z]*|mmcblk[0-9]*", ATTR{queue/rotational}=="0", \
        ATTR{queue/scheduler}="adios"

    # NVMe SSD
    ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/rotational}=="0", \
        ATTR{queue/scheduler}="adios"

  '';

}
