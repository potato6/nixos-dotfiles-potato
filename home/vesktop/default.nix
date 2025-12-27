{ pkgs, ... }:

# NixOS Home Manager snippet that separates Vesktop-native settings from Vencord settings.
# Vesktop native settings -> programs.vesktop.settings (written to $XDG_CONFIG_HOME/vesktop/settings.json)
# Vencord-specific settings -> programs.vesktop.vencord.settings (written to $XDG_CONFIG_HOME/vesktop/settings/settings.json)
# Put theme files under programs.vesktop.vencord.themes so enabledThemes references them by filename.

{
  programs.vesktop = {
    enable = true;
    package = pkgs.vesktop;

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

        # themeLinks and enabledThemes are Vencord settings
        themeLinks =
          [ "https://refact0r.github.io/system24/build/system24.css" ];
        enabledThemes = [ "system24.css" ];

        enableReactDevtools = false;

        # UI toggles that belong to Vencord rather than Vesktop native settings
        frameless = true;
        transparent = true;
        winCtrlQ = false;
        winNativeTitleBar = false;

        # plugins: paste your Vencord plugin map here (if you have one)
        plugins = {

          ChatInputButtonAPI = { enabled = true; };
          CommandsAPI = { enabled = true; };
          MemberListDecoratorsAPI = { enabled = false; };
          MessageAccessoriesAPI = { enabled = true; };
          MessageDecorationsAPI = { enabled = false; };
          MessageEventsAPI = { enabled = true; };
          MessagePopoverAPI = { enabled = false; };
          MessageUpdaterAPI = { enabled = false; };
          ServerListAPI = { enabled = false; };
          UserSettingsAPI = { enabled = true; };
          AccountPanelServerProfile = { enabled = false; };
          AlwaysAnimate = { enabled = false; };
          AlwaysExpandRoles = { enabled = false; };
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
          AppleMusicRichPresence = { enabled = false; };
          "WebRichPresence (arRPC)" = { enabled = false; };
          BANger = { enabled = false; };
          BetterFolders = { enabled = true; };
          BetterGifAltText = { enabled = true; };
          BetterGifPicker = { enabled = true; };
          BetterNotesBox = { enabled = true; };
          BetterRoleContext = { enabled = true; };
          BetterRoleDot = { enabled = true; };
          BetterSessions = { enabled = false; };
          BetterSettings = { enabled = true; };
          BetterUploadButton = { enabled = true; };
          BiggerStreamPreview = { enabled = true; };
          BlurNSFW = { enabled = false; };
          CallTimer = { enabled = true; };
          ClearURLs = { enabled = true; };
          ClientTheme = { enabled = false; };
          ColorSighted = { enabled = false; };
          ConsoleJanitor = { enabled = false; };
          ConsoleShortcuts = { enabled = false; };
          CopyEmojiMarkdown = { enabled = false; };
          CopyFileContents = { enabled = true; };
          CopyUserURLs = { enabled = true; };
          CrashHandler = { enabled = true; };
          CtrlEnterSend = { enabled = false; };
          CustomRPC = { enabled = false; };
          CustomIdle = { enabled = false; };
          Dearrow = { enabled = false; };
          Decor = { enabled = false; };
          DisableCallIdle = { enabled = false; };
          DontRoundMyTimestamps = { enabled = false; };
          EmoteCloner = { enabled = false; };
          Experiments = { enabled = true; };
          F8Break = { enabled = false; };
          FakeNitro = {
            enabled = false;
            enableEmojiBypass = false;
            emojiSize = 48;
            transformEmojis = false;
            enableStickerBypass = true;
            stickerSize = 160;
            transformStickers = true;
            transformCompoundSentence = false;
            enableStreamQualityBypass = true;
            useHyperLinks = true;
            hyperLinkText = "{{NAME}}";
            disableEmbedPermissionCheck = false;
          };
          FakeProfileThemes = { enabled = false; };
          FavoriteEmojiFirst = { enabled = false; };
          FavoriteGifSearch = { enabled = true; };
          FixCodeblockGap = { enabled = true; };
          FixSpotifyEmbeds = { enabled = false; };
          FixYoutubeEmbeds = { enabled = true; };
          ForceOwnerCrown = { enabled = true; };
          FriendInvites = { enabled = false; };
          FriendsSince = { enabled = true; };
          FullSearchContext = { enabled = false; };
          GameActivityToggle = { enabled = false; };
          GifPaste = { enabled = true; };
          GreetStickerPicker = { enabled = true; };
          HideAttachments = { enabled = false; };
          iLoveSpam = { enabled = false; };
          IgnoreActivities = { enabled = false; };
          ImageLink = { enabled = false; };
          ImageZoom = { enabled = false; };

          ImageFilename = { enabled = true; };

          ImplicitRelationships = { enabled = true; };
          InvisibleChat = { enabled = false; };
          KeepCurrentChannel = { enabled = false; };
          LastFMRichPresence = { enabled = false; };
          LoadingQuotes = { enabled = false; };
          MemberCount = {
            enabled = true;
            memberList = true;
            toolTip = true;
          };
          MentionAvatars = { enabled = false; };
          MessageClickActions = { enabled = true; };
          MessageLatency = { enabled = false; };
          MessageLinkEmbeds = { enabled = false; };
          MessageLogger = { enabled = false; };
          MessageTags = { enabled = true; };
          MoreCommands = { enabled = false; };
          MoreKaomoji = { enabled = true; };
          MoreUserTags = { enabled = false; };
          Moyai = { enabled = false; };
          MutalGroupDMs = {
            enabled = false;
          }; # typo-safe placeholder (original JSON has "MutualGroupDMs")
          MutualGroupDMs = { enabled = false; };
          NewGuildSettings = { enabled = false; };
          NoBlockedMessages = { enabled = false; };
          NoDevtoolsWarning = { enabled = false; };
          NoF1 = { enabled = true; };
          NoMaskedUrlPaste = { enabled = false; };
          NoMosaic = { enabled = false; };
          NoOnboardingDelay = { enabled = true; };
          NoPendingCount = { enabled = false; };
          NoProfileThemes = { enabled = false; };
          NoReplyMention = { enabled = false; };
          NoScreensharePreview = { enabled = false; };
          NoServerEmojis = { enabled = true; };
          NoTypingAnimation = { enabled = true; };
          NoUnblockToJump = { enabled = false; };
          NormalizeMessageLinks = { enabled = false; };
          NotificationVolume = { enabled = false; };
          NSFWGateBypass = { enabled = true; };
          OnePingPerDM = { enabled = false; };
          oneko = { enabled = false; };
          OpenInApp = { enabled = false; };
          OverrideForumDefaults = { enabled = false; };
          PartyMode = { enabled = false; };
          PauseInvitesForever = { enabled = false; };
          PermissionFreeWill = { enabled = true; };
          PermissionsViewer = { enabled = true; };
          petpet = { enabled = true; };
          PictureInPicture = { enabled = false; };
          PinDMs = { enabled = false; };
          PlainFolderIcon = { enabled = true; };
          PlatformIndicators = { enabled = true; };
          PreviewMessage = { enabled = true; };
          QuickMention = { enabled = false; };
          QuickReply = { enabled = false; };
          ReactErrorDecoder = { enabled = false; };
          ReadAllNotificationsButton = { enabled = false; };
          RelationshipNotifier = { enabled = true; };
          ReplaceGoogleSearch = { enabled = false; };
          ReplyTimestamp = { enabled = false; };
          RevealAllSpoilers = { enabled = false; };
          ReverseImageSearch = { enabled = true; };
          ReviewDB = { enabled = false; };
          RoleColorEverywhere = { enabled = false; };
          SecretRingToneEnabler = { enabled = false; };
          Summaries = { enabled = true; };
          SendTimestamps = {
            enabled = true;
            replaceMessageContents = true;
          };
          ServerInfo = { enabled = true; };
          ServerListIndicators = { enabled = true; };
          ShikiCodeblocks = {
            enabled = true;
            useDevIcon = "COLOR";
            theme =
              "https://raw.githubusercontent.com/shikijs/shiki/0b28ad8ccfbf2615f2d9d38ea8255416b8ac3043/packages/shiki/themes/dracula.json";
            tryHljs = "SECONDARY";
            bgOpacity = 100;
          };
          ShowAllMessageButtons = { enabled = false; };
          ShowConnections = { enabled = true; };
          ShowHiddenChannels = { enabled = true; };
          ShowHiddenThings = { enabled = true; };
          ShowMeYourName = { enabled = false; };
          ShowTimeoutDuration = { enabled = false; };
          SilentMessageToggle = { enabled = false; };
          SilentTyping = { enabled = false; };
          SortFriendRequests = { enabled = false; };
          SpotifyControls = { enabled = false; };
          SpotifyCrack = { enabled = false; };
          SpotifyShareCommands = { enabled = false; };
          StartupTimings = { enabled = false; };
          StickerPaste = { enabled = true; };
          StreamerModeOnStream = { enabled = false; };
          SuperReactionTweaks = { enabled = true; };
          TextReplace = { enabled = false; };
          ThemeAttributes = { enabled = false; };
          Translate = { enabled = false; };
          TypingIndicator = { enabled = false; };
          TypingTweaks = { enabled = true; };
          Unindent = { enabled = false; };
          UnlockedAvatarZoom = { enabled = false; };
          UnsuppressEmbeds = { enabled = false; };
          UserVoiceShow = { enabled = false; };
          USRBG = { enabled = false; };
          ValidReply = { enabled = true; };
          ValidUser = { enabled = true; };
          VoiceChatDoubleClick = { enabled = false; };
          VcNarrator = { enabled = false; };
          VencordToolbox = { enabled = false; };
          ViewIcons = { enabled = true; };
          ViewRaw = { enabled = true; };
          VoiceDownload = { enabled = false; };
          VoiceMessages = { enabled = false; };
          VolumeBooster = { enabled = false; };
          WebKeybinds = { enabled = true; };
          WebScreenShareFixes = { enabled = true; };
          WhoReacted = { enabled = true; };
          XSOverlay = { enabled = false; };
          YoutubeAdblock = { enabled = true; };
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
          SupportHelper = { enabled = true; };
          UserMessagesPronouns = {
            enabled = true;
            showInMessages = true;
            showSelf = true;
            pronounSource = 0;
            pronounsFormat = "LOWERCASE";
          };
          DynamicImageModalAPI = { enabled = false; };
          FixImagesQuality = { enabled = true; };
        };

        notifications = {
          timeout = 5000;
          position = "bottom-right";
          useNative = "not-focused";
          logLimit = 50;
        };

        cloud = {
          authenticated = false;
          url = "https://api.vencord.dev/";
          settingsSync = false;
          settingsSyncVersion = 1734993730812;
        };
      };
    };
  };

  home.file.".config/vesktop/settings/quickCss.css".text = ''
    :root {
      /* Monochrome (Grayscale) Accents */
      --accent-1: oklch(75% 0 0);
      --accent-2: oklch(70% 0 0);
      --accent-3: oklch(65% 0 0);
      --accent-4: oklch(60% 0 0);
      --accent-5: oklch(55% 0 0);
      --accent-new: oklch(70% 0 0); /* Mute/Delete buttons */
    }

    body {
      /* Font Overrides */
      --font: 'Verdana', sans-serif;
      --code-font: 'Consolas', monospace; 
      
      /* Reset styles meant for the original monospace font */
      font-weight: 400; 
      letter-spacing: normal; 
    }
  '';

}
