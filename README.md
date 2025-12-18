# nixos-dotfiles-🥔

this is just the personal dotfiles that i use, hyprland + home manager + [DankMaterialShell
](https://github.com/AvengeMedia/DankMaterialShell);

 ...as a side goal with this is to optimize every aspect of the system with a similar goal to [cachyos](https://github.com/CachyOS)

**reminders for future instalations:**

there are specific optimizations in /system/storage.nix for BTRFS in SSDs and EXT4 in spinning disks, this may or may not cause a issue if you use a SSD in EXT4 or vice versa so keep that in mind.

delete the auto generated /etc/resolve.conf upon a new installation since this is using dnscrypt-proxy as a dns provider;

generate monitor.conf by using nwg-displays, then re-run nixos builder

there is a bug in current wine/proton that 'right click' context menu doesn work with the env PROTON_ENABLE_WAYLAND = 1, if you are opening a non-game.

# Credits
contains parts copied/learned from many different developers across github. 

https://github.com/JaKooLit/Hyprland-Dots

https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles

https://github.com/JohnRTitor/nix-conf

https://github.com/izhrs/dotfiles

https://github.com/colemickens/nixcfg

https://github.com/CachyOS/CachyOS-Settings

...and others i do not remember but i'm thankful for so many examples and knowlege the community has provided.
