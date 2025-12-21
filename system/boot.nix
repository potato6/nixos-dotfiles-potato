{ pkgs, config, ... }: {

  boot = {

    # for the time being this will stay commented since i'm using cachyos kernel, see ./flake.nix

    # kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    # extraModulePackages = with config.boot.kernelPackages; [ xone zenpower ];

    # Initrd Settings - stage 1 boot
    loader = {
      systemd-boot = {
        enable = true; # Enable systemd-boot for EFI systems
        editor = false; # allow editing the kernel command-line before boot.
      };
      timeout =
        1; # timeout (in seconds) until loader boots the default menu item
    };

    kernelParams = [
      "processor.ignore_ppc=1"
      "ec_sys.write_support=1"
      "tsc=reliable"
      "clocksource=tsc"
      "nowatchdog"
      "nmi_watchdog=0"
      "microcode.amd_sha_check=off" # ucodenix requires this
    ];
    kernel.sysctl = {
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

      # Taken from cachyos https://github.com/CachyOS/CachyOS-Settings
      "vm.swappiness" = 100;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_bytes" = 268435456;
      "vm.page-cluster" = 0;
      "vm.dirty_background_bytes" = 67108864;
      "vm.dirty_writeback_centisecs" = 1500;
      "kernel.nmi_watchdog" = 0;
      "kernel.kptr_restrict" = 2;
      "kernel.kexec_load_disabled" = 1;
      "net.core.netdev_max_backlog" = 4096;
      "fs.file-max" = 2097152;

      # the settings below were taken from ArchWiki
      # https://wiki.archlinux.org/title/Sysctl#Improving_performance

      # Enable TCP Fast Open
      "net.ipv4.tcp_fastopen" = 3;

      # Enable MTU probing
      "net.ipv4.tcp_mtu_probing" = 1;

      # TCP BBR congestion control (Requires 'tcp_bbr' module)
      "net.core.default_qdisc" = "cake";
      "net.ipv4.tcp_congestion_control" = "bbr";

      # Virtual Memory - Performance Tuning
      "vm.dirty_ratio" = 10;
      "vm.dirty_background_ratio" = 5;

      # Specify minimum free Kbytes at which VM pressure happens
      "vm.min_free_kbytes" = 65536;

      # Strictly limits memory allocation to physical RAM + swap, preventing overcommit and reducing OOM risks.
      "vm.overcommit_memory" = 2;

      # Sets overcommit to 100% of RAM when enabled, but ignored here since overcommit_memory = 2 disables it.
      "vm.overcommit_ratio" = 100;
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

