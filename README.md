# nixos-dotfiles-🥔

this is just the personal dotfiles that i use, Niri + home manager + [DankMaterialShell
](https://github.com/AvengeMedia/DankMaterialShell);

**reminders for future instalations:**

_SUPER + H for auto generated keybinds helper_

by default niri does not validate unless you go to dms-shell config and generate the config files for the includes

in ./home/niri/config/config.kdl

```kdl
include "dms/outputs.kdl"
include "dms/colors.kdl"
```

delete the auto generated /etc/resolve.conf upon a new installation since this is using dnscrypt-proxy as a dns provider;

there is a bug in current wine/proton that 'right click' context menu doesn work with the env PROTON_ENABLE_WAYLAND = 1, if you are opening a non-game.

# Credits

contains parts referenced from many different developers across github.

https://github.com/JaKooLit/Hyprland-Dots

https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles

https://github.com/JohnRTitor/nix-conf

https://github.com/izhrs/dotfiles

https://github.com/colemickens/nixcfg

https://github.com/CachyOS/CachyOS-Settings

...and others i do not remember but i'm thankful for so many examples and knowlege the community has provided.
