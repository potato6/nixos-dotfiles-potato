{ ... }:

# NixOS Home Manager snippet that separates Vesktop-native settings from Vencord settings.
# Vesktop native settings -> programs.vesktop.settings (written to $XDG_CONFIG_HOME/vesktop/settings.json)
# Vencord-specific settings -> programs.vesktop.vencord.settings (written to $XDG_CONFIG_HOME/vesktop/settings/settings.json)
# Put theme files under programs.vesktop.vencord.themes so enabledThemes references them by filename.

{
  programs.vesktop = {
    enable = true;

    # Vesktop-native settings (from src/shared/settings.d.ts)
    settings = {
      # "stable" | "canary" | "ptb"
      discordBranch = "stable";

      # "none" | "mica" | "tabbed" | "acrylic"
      transparencyOption = "acrylic";

      tray = true;
      minimizeToTray = true;
      autoStartMinimized = false;
      openLinksWithElectron = false;
      staticTitle = true;
      enableMenu = true;

      # disable smooth scrolling in the renderer (Vesktop native)
      disableSmoothScroll = true;

      hardwareAcceleration = true;
      hardwareVideoAcceleration = true;

      # arRPC / Web Rich Presence (native toggle)
      arRPC = true;

      appBadge = false;
      disableMinSize = true;

      # when clicking the tray icon, show/hide the window
      clickTrayToShowHide = true;

      customTitleBar = false;
    };

    # Vencord-specific config (moved out of programs.vesktop.settings)
    vencord = {
      # use system Vencord package if you want (adjust as needed)
      useSystem = true;

      # Themes managed by Home Manager. Replace the string with a path or CSS content.
      # These will be written to $XDG_CONFIG_HOME/vesktop/themes/<name>.css
      themes = { };

      # Vencord settings (these are written to $XDG_CONFIG_HOME/vesktop/settings/settings.json)
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        useQuickCss = true;

        enableReactDevtools = false;

        # UI toggles that belong to Vencord rather than Vesktop native settings
        frameless = true;
        transparent = true;
        winCtrlQ = false;
        winNativeTitleBar = false;

        # plugins: paste your Vencord plugin map here (if you have one)
        plugins = {

          FakeNitro = {
            enabled = true;
            enableEmojiBypass = true;
            enableStickerBypass = true;
            enableStreamQualityBypass = true;
            transformStickers = true;
            transformEmojis = true;
            transformCompoundSentence = false;
            emojiSize = 48;
            stickerSize = 160;
          };

          AccountPanelServerProfile = {
            enabled = true;
          };
          AlwaysExpandRoles = {
            enabled = true;
          };
          AlwaysTrust = {
            enabled = true;
            domain = true;
            file = true;
          };
          AnonymiseFileNames = {
            enabled = true;
            anonymiseByDefault = false;
            method = 0;
            randomisedLength = 7;
          };
          BetterFolders = {
            enabled = true;
          };
          BetterGifPicker = {
            enabled = true;
          };
          BetterNotesBox = {
            enabled = true;
          };
          BetterRoleContext = {
            enabled = true;
          };
          BetterRoleDot = {
            enabled = true;
          };
          BetterSessions = {
            enabled = true;
          };
          BetterSettings = {
            enabled = true;
          };
          BetterUploadButton = {
            enabled = true;
          };
          BiggerStreamPreview = {
            enabled = true;
          };
          CallTimer = {
            enabled = true;
          };
          ClearURLs = {
            enabled = true;
          };
          ColorSighted = {
            enabled = true;
          };
          ConsoleJanitor = {
            enabled = true;
          };
          ConsoleShortcuts = {
            enabled = true;
          };
          CopyEmojiMarkdown = {
            enabled = true;
          };
          CopyFileContents = {
            enabled = true;
          };
          CopyUserURLs = {
            enabled = true;
          };
          CrashHandler = {
            enabled = true;
          };
          F8Break = {
            enabled = true;
          };
          FakeProfileThemes = {
            enabled = true;
          };
          FavoriteGifSearch = {
            enabled = true;
          };
          FixCodeblockGap = {
            enabled = true;
          };
          FixSpotifyEmbeds = {
            enabled = true;
          };
          FixYoutubeEmbeds = {
            enabled = true;
          };
          ForceOwnerCrown = {
            enabled = true;
          };
          FriendsSince = {
            enabled = true;
          };
          FullSearchContext = {
            enabled = true;
          };
          GameActivityToggle = {
            enabled = true;
          };
          iLoveSpam = {
            enabled = true;
          };
          ImageLink = {
            enabled = true;
          };
          ImageFilename = {
            enabled = true;
          };
          ImplicitRelationships = {
            enabled = true;
          };
          KeepCurrentChannel = {
            enabled = true;
          };
          MemberCount = {
            enabled = true;
            memberList = true;
            toolTip = true;
          };
          MentionAvatars = {
            enabled = false;
          };
          MessageClickActions = {
            enabled = true;
          };
          MessageLatency = {
            enabled = true;
          };
          MessageLinkEmbeds = {
            enabled = true;
          };
          MessageLogger = {
            enabled = true;
          };
          MutualGroupDMs = {
            enabled = true;
          };
          NewGuildSettings = {
            enabled = true;
          };
          NoBlockedMessages = {
            enabled = true;
          };
          NoDevtoolsWarning = {
            enabled = true;
          };
          NoF1 = {
            enabled = true;
          };
          NoOnboardingDelay = {
            enabled = true;
          };
          NoPendingCount = {
            enabled = true;
          };
          NoProfileThemes = {
            enabled = true;
          };
          NoServerEmojis = {
            enabled = true;
          };
          NoTypingAnimation = {
            enabled = true;
          };
          NoUnblockToJump = {
            enabled = true;
          };
          NotificationVolume = {
            enabled = true;
          };
          NSFWGateBypass = {
            enabled = true;
          };
          OverrideForumDefaults = {
            enabled = true;
          };
          PauseInvitesForever = {
            enabled = true;
          };
          PermissionFreeWill = {
            enabled = true;
          };
          PermissionsViewer = {
            enabled = true;
          };
          petpet = {
            enabled = true;
          };
          PictureInPicture = {
            enabled = true;
          };
          PinDMs = {
            enabled = false;
          };
          PlainFolderIcon = {
            enabled = true;
          };
          PlatformIndicators = {
            enabled = true;
          };
          PreviewMessage = {
            enabled = true;
          };
          QuickMention = {
            enabled = true;
          };
          QuickReply = {
            enabled = true;
          };
          ReactErrorDecoder = {
            enabled = true;
          };
          ReadAllNotificationsButton = {
            enabled = true;
          };
          RelationshipNotifier = {
            enabled = true;
          };
          ReplyTimestamp = {
            enabled = false;
          };
          RevealAllSpoilers = {
            enabled = false;
          };
          ReverseImageSearch = {
            enabled = true;
          };
          ReviewDB = {
            enabled = true;
          };
          RoleColorEverywhere = {
            enabled = true;
          };
          Summaries = {
            enabled = true;
          };
          ServerInfo = {
            enabled = true;
          };
          ServerListIndicators = {
            enabled = true;
          };
          ShikiCodeblocks = {
            enabled = true;
            useDevIcon = "COLOR";
            theme = "https://raw.githubusercontent.com/shikijs/shiki/0b28ad8ccfbf2615f2d9d38ea8255416b8ac3043/packages/shiki/themes/dracula.json";
            tryHljs = "SECONDARY";
            bgOpacity = 100;
          };
          ShowConnections = {
            enabled = true;
          };
          ShowHiddenChannels = {
            enabled = true;
          };
          ShowHiddenThings = {
            enabled = true;
          };
          ShowTimeoutDuration = {
            enabled = true;
          };
          SilentMessageToggle = {
            enabled = true;
          };
          SortFriendRequests = {
            enabled = true;
          };
          SpotifyControls = {
            enabled = true;
          };
          SpotifyCrack = {
            enabled = true;
          };
          StartupTimings = {
            enabled = true;
          };
          StickerPaste = {
            enabled = true;
          };
          StreamerModeOnStream = {
            enabled = true;
          };
          SuperReactionTweaks = {
            enabled = true;
          };
          TypingIndicator = {
            enabled = true;
          };
          TypingTweaks = {
            enabled = true;
          };
          Unindent = {
            enabled = true;
          };
          UnlockedAvatarZoom = {
            enabled = true;
          };
          UnsuppressEmbeds = {
            enabled = true;
          };
          UserVoiceShow = {
            enabled = true;
          };
          USRBG = {
            enabled = true;
          };
          ValidReply = {
            enabled = true;
          };
          ValidUser = {
            enabled = true;
          };
          VoiceChatDoubleClick = {
            enabled = true;
          };
          VencordToolbox = {
            enabled = true;
          };
          ViewIcons = {
            enabled = true;
          };
          ViewRaw = {
            enabled = true;
          };
          VoiceDownload = {
            enabled = true;
          };
          VoiceMessages = {
            enabled = true;
          };
          VolumeBooster = {
            enabled = true;
          };
          WebKeybinds = {
            enabled = true;
          };
          WebScreenShareFixes = {
            enabled = true;
          };
          YoutubeAdblock = {
            enabled = true;
          };
          NoTrack = {
            enabled = true;
            disableAnalytics = true;
          };
          WebContextMenus = {
            enabled = true;
            addBack = true;
          };
          Settings = {
            enabled = true;
            settingsLocation = "aboveNitro";
          };
          SupportHelper = {
            enabled = true;
          };
          FixImagesQuality = {
            enabled = true;
          };

        };
      };
    };
  };
}
