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

    extraModulePackages = [
      config.boot.kernelPackages.zenpower
    ];

    kernelModules = [
      "zenpower"
    ];

    kernelParams = [
      "lru_gen.enabled=y" # MGLRU
      "split_lock_detect=off"
      "processor.ignore_ppc=1"
      "ec_sys.write_support=1"
      "tsc=reliable"
      "clocksource=tsc"
      "nowatchdog"
      "nmi_watchdog=0"
      "microcode.amd_sha_check=off" # ucodenix requires this
    ];

    kernel.sysctl = {

      "kernel.sched_autogroup_enabled" = 1; # EXPERIMENTAL
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

      # Increase netdev receive queue
      # May help prevent losing packets
      "net.core.netdev_max_backlog" = 4096;

      # Fix for some modded games
      "vm.max_map_count" = 2147483642;
      "fs.file-max" = 524288;

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
      "net.ipv4.tcp_fin_timeout" = 30;
      "net.ipv4.tcp_max_syn_backlog" = 2048;
      "net.ipv4.tcp_max_tw_buckets" = 400000;
      "net.ipv4.tcp_window_scaling" = 1;
      "net.ipv4.tcp_sack" = 1;
      "net.core.rmem_max" = 16777216;
      "net.core.wmem_max" = 16777216;
      "net.ipv4.tcp_rmem" = "4096 87380 16777216"; # Min, Default, Max
      "net.ipv4.tcp_wmem" = "4096 87380 16777216";
      "net.core.somaxconn" = 1024;
      "net.ipv4.tcp_syncookies" = 1;
      "net.ipv4.tcp_base_mss" = 536;
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
