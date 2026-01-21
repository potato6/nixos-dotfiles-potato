{ ... }:
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
