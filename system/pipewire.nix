{ ... }:
{
  security.rtkit.enable = true; # RealtimeKit system service
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;

    extraConfig.pipewire = {
      # 1. Reduce context switching frequency by raising the base quantum
      "10-clock-quantum.conf" = {
        context.properties = {
          # Prevents ultra-fast context switching.
          # 512 gives ~10ms of latency, which is imperceptible for gaming/desktop use
          # but massively relieves the scheduler.
          "default.clock.min-quantum" = 512;
          "default.clock.quantum" = 1024;
        };
      };

      "20-rt-tuning.conf" = {
        context.modules = [
          {
            name = "libpipewire-module-rt";
            args = {
              # 2. Prevent the core RT scheduler from fighting LAVD.
              # Setting this to 0 disables SCHED_FIFO and lets LAVD "see" and manage the thread.
              rt.prio = 0;

              # Use a standard nice level instead, which LAVD respects and prioritizes natively.
              nice.level = -15;

              rt.time.soft = -1;
              rt.time.hard = -1;
            };
          }
        ];
      };
    };

    # 3. Add ALSA Headroom (Optional but highly recommended for sched-ext users)
    # Acts as a "shock absorber" if LAVD takes a microsecond too long to yield the CPU.
    wireplumber.extraConfig = {
      "10-alsa-headroom" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              { "node.name" = "~alsa_output.*"; }
            ];
            actions = {
              update-props = {
                "api.alsa.headroom" = 1024;
              };
            };
          }
        ];
      };
    };

  };
}
