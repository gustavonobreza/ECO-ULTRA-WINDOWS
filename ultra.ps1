$MaxRefreshRate = 144; # 60hz
$UltraModeWindows = "scheme_min"; # Economy mode
$BrightnessPercent = 100;
# Disable dedicated GPU #get you GPU ID reading: https://dev.to/muhammedziyad/automatically-disable-and-enable-your-gpu-or-any-other-device-when-your-laptop-power-state-changes-hf5
$GPU_ID = "PCI\VEN_10DE&DEV_1F9D&SUBSYS_143E1025&REV_A1\4&2F204912&0&0008";


# Enable 144hz mode in screnn
Invoke-Expression ($PSScriptRoot + ".\QRes.exe /r:${MaxRefreshRate}"); 

# Enable UltraMode in Windows
powercfg /setactive ${UltraModeWindows}

# Enable dedicated GPU
pnputil /enable-device ${GPU_ID}

# Set Brightness to Maximum
WMIC /NAMESPACE:\\root\wmi PATH WmiMonitorBrightnessMethods WHERE "Active=TRUE" CALL WmiSetBrightness Brightness=${BrightnessPercent} Timeout=0