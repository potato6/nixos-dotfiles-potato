{ ... }: {

  programs.dankMaterialShell = {
    enable = true;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged =
        true; # Auto-restart dms.service when dankMaterialShell changes

    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)

    # Converted from settings.json
    default.settings = {
      currentThemeName = "monochrome";
      customThemeFile = "";
      matugenScheme = "scheme-tonal-spot";
      runUserMatugenTemplates = true;
      matugenTargetMonitor = "";
      popupTransparency = 0.44;
      dockTransparency = 1;
      widgetBackgroundColor = "sch";
      widgetColorMode = "colorful";
      cornerRadius = 0;
      use24HourClock = true;
      showSeconds = true;
      useFahrenheit = false;
      nightModeEnabled = false;
      animationSpeed = 0;
      customAnimationDuration = 500;
      wallpaperFillMode = "Fill";
      blurredWallpaperLayer = false;
      blurWallpaperOnOverview = false;
      showLauncherButton = true;
      showWorkspaceSwitcher = true;
      showFocusedWindow = true;
      showWeather = true;
      showMusic = true;
      showClipboard = true;
      showCpuUsage = true;
      showMemUsage = true;
      showCpuTemp = true;
      showGpuTemp = true;
      selectedGpuIndex = 0;
      enabledGpuPciIds = [ ];
      showSystemTray = true;
      showClock = true;
      showNotificationButton = true;
      showBattery = true;
      showControlCenterButton = true;
      showCapsLockIndicator = true;
      controlCenterShowNetworkIcon = true;
      controlCenterShowBluetoothIcon = true;
      controlCenterShowAudioIcon = true;
      controlCenterShowVpnIcon = true;
      controlCenterShowBrightnessIcon = false;
      controlCenterShowMicIcon = false;
      controlCenterShowBatteryIcon = false;
      controlCenterShowPrinterIcon = false;
      showPrivacyButton = true;
      privacyShowMicIcon = false;
      privacyShowCameraIcon = false;
      privacyShowScreenShareIcon = false;

      controlCenterWidgets = [
        {
          id = "volumeSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "brightnessSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "wifi";
          enabled = true;
          width = 50;
        }
        {
          id = "bluetooth";
          enabled = true;
          width = 50;
        }
        {
          id = "audioOutput";
          enabled = true;
          width = 50;
        }
        {
          id = "audioInput";
          enabled = true;
          width = 50;
        }
        {
          id = "nightMode";
          enabled = true;
          width = 50;
        }
        {
          id = "darkMode";
          enabled = true;
          width = 50;
        }
      ];

      showWorkspaceIndex = true;
      showWorkspacePadding = true;
      workspaceScrolling = false;
      showWorkspaceApps = true;
      maxWorkspaceIcons = 3;
      workspacesPerMonitor = true;
      showOccupiedWorkspacesOnly = true;
      dwlShowAllTags = false;
      workspaceNameIcons = { };
      waveProgressEnabled = true;
      scrollTitleEnabled = true;
      audioVisualizerEnabled = true;
      clockCompactMode = false;
      focusedWindowCompactMode = false;
      runningAppsCompactMode = true;
      keyboardLayoutNameCompactMode = false;
      runningAppsCurrentWorkspace = true;
      runningAppsGroupByApp = false;
      centeringMode = "geometric";
      clockDateFormat = "";
      lockDateFormat = "";
      mediaSize = 1;
      appLauncherViewMode = "list";
      spotlightModalViewMode = "list";
      sortAppsAlphabetically = false;
      appLauncherGridColumns = 4;
      spotlightCloseNiriOverview = true;
      niriOverviewOverlayEnabled = true;
      weatherLocation = "New York, NY";
      weatherCoordinates = "40.7128,-74.0060";
      useAutoLocation = true;
      weatherEnabled = true;
      networkPreference = "auto";
      vpnLastConnected = "";
      iconTheme = "System Default";
      launcherLogoMode = "os";
      launcherLogoCustomPath = "";
      launcherLogoColorOverride = "";
      launcherLogoColorInvertOnMode = false;
      launcherLogoBrightness = 0.5;
      launcherLogoContrast = 1;
      launcherLogoSizeOffset = 0;
      fontFamily = "Inter Variable";
      monoFontFamily = "Fira Code";
      fontWeight = 700;
      fontScale = 1.1;
      notepadUseMonospace = true;
      notepadFontFamily = "";
      notepadFontSize = 14;
      notepadShowLineNumbers = false;
      notepadTransparencyOverride = -1;
      notepadLastCustomTransparency = 0.7;
      soundsEnabled = true;
      useSystemSoundTheme = false;
      soundNewNotification = true;
      soundVolumeChanged = true;
      soundPluggedIn = true;
      acMonitorTimeout = 0;
      acLockTimeout = 0;
      acSuspendTimeout = 0;
      acSuspendBehavior = 0;
      acProfileName = "";
      batteryMonitorTimeout = 0;
      batteryLockTimeout = 0;
      batterySuspendTimeout = 0;
      batterySuspendBehavior = 0;
      batteryProfileName = "";
      lockBeforeSuspend = false;
      loginctlLockIntegration = true;
      fadeToLockEnabled = false;
      fadeToLockGracePeriod = 5;
      launchPrefix = "";
      brightnessDevicePins = { };
      wifiNetworkPins = { };
      bluetoothDevicePins = { };
      audioInputDevicePins = { };
      audioOutputDevicePins = { };
      gtkThemingEnabled = false;
      qtThemingEnabled = false;
      syncModeWithPortal = true;
      terminalsAlwaysDark = true;
      runDmsMatugenTemplates = true;
      matugenTemplateGtk = true;
      matugenTemplateNiri = true;
      matugenTemplateQt5ct = true;
      matugenTemplateQt6ct = true;
      matugenTemplateFirefox = true;
      matugenTemplatePywalfox = true;
      matugenTemplateVesktop = true;
      matugenTemplateGhostty = true;
      matugenTemplateKitty = true;
      matugenTemplateFoot = true;
      matugenTemplateAlacritty = true;
      matugenTemplateWezterm = true;
      matugenTemplateDgop = true;
      matugenTemplateKcolorscheme = true;
      matugenTemplateVscode = true;
      showDock = false;
      dockAutoHide = false;
      dockGroupByApp = false;
      dockOpenOnOverview = false;
      dockPosition = 1;
      dockSpacing = 4;
      dockBottomGap = 0;
      dockMargin = 0;
      dockIconSize = 57;
      dockIndicatorStyle = "circle";
      dockBorderEnabled = false;
      dockBorderColor = "surfaceText";
      dockBorderOpacity = 1;
      dockBorderThickness = 1;
      notificationOverlayEnabled = true;
      modalDarkenBackground = true;
      lockScreenShowPowerActions = true;
      lockScreenShowSystemIcons = true;
      lockScreenShowTime = true;
      lockScreenShowDate = true;
      lockScreenShowProfileImage = true;
      lockScreenShowPasswordField = true;
      enableFprint = false;
      maxFprintTries = 15;
      lockScreenActiveMonitor = "all";
      lockScreenInactiveColor = "#000000";
      hideBrightnessSlider = false;
      notificationTimeoutLow = 3000;
      notificationTimeoutNormal = 5000;
      notificationTimeoutCritical = 0;
      notificationPopupPosition = 0;
      osdAlwaysShowValue = false;
      osdPosition = 5;
      osdVolumeEnabled = true;
      osdMediaVolumeEnabled = true;
      osdBrightnessEnabled = true;
      osdIdleInhibitorEnabled = true;
      osdMicMuteEnabled = true;
      osdCapsLockEnabled = true;
      osdPowerProfileEnabled = true;
      osdAudioOutputEnabled = true;
      powerActionConfirm = true;
      powerActionHoldDuration = 0.5;
      powerMenuActions =
        [ "reboot" "logout" "poweroff" "lock" "suspend" "restart" ];
      powerMenuDefaultAction = "logout";
      powerMenuGridLayout = true;
      customPowerActionLock = "";
      customPowerActionLogout = "";
      customPowerActionSuspend = "";
      customPowerActionHibernate = "";
      customPowerActionReboot = "";
      customPowerActionPowerOff = "";
      updaterUseCustomCommand = false;
      updaterCustomCommand = "";
      updaterTerminalAdditionalParams = "";
      displayNameMode = "system";
      screenPreferences = { };
      showOnLastDisplay = { };

      barConfigs = [{
        id = "default";
        name = "Main Bar";
        enabled = true;
        position = 0;
        screenPreferences = [ "all" ];
        showOnLastDisplay = true;
        leftWidgets = [
          {
            id = "launcherButton";
            enabled = true;
          }
          {
            id = "workspaceSwitcher";
            enabled = true;
          }
          {
            id = "cpuTemp";
            enabled = true;
          }
          {
            id = "gpuTemp";
            enabled = true;
            selectedGpuIndex = 0;
            pciId = "1002:731f";
          }
        ];
        centerWidgets = [ ];
        rightWidgets = [
          {
            id = "music";
            enabled = true;
          }
          {
            id = "systemTray";
            enabled = true;
          }
          {
            id = "clipboard";
            enabled = true;
          }
          {
            id = "notificationButton";
            enabled = true;
          }
          {
            id = "clock";
            enabled = true;
            clockCompactMode = false;
          }
          {
            id = "controlCenterButton";
            enabled = true;
          }
        ];
        spacing = 0;
        innerPadding = 7;
        bottomGap = -10;
        transparency = 0;
        widgetTransparency = 0;
        squareCorners = true;
        noBackground = true;
        gothCornersEnabled = false;
        gothCornerRadiusOverride = false;
        gothCornerRadiusValue = 12;
        borderEnabled = false;
        borderColor = "surfaceText";
        borderOpacity = 1;
        borderThickness = 1;
        widgetOutlineEnabled = false;
        widgetOutlineColor = "primary";
        widgetOutlineOpacity = 1.0e-2;
        widgetOutlineThickness = 1;
        fontScale = 1.08;
        autoHide = false;
        autoHideDelay = 250;
        openOnOverview = false;
        visible = true;
        popupGapsAuto = true;
        popupGapsManual = 4;
        maximizeDetection = true;
      }];

      configVersion = 2;
    };
  };

}
