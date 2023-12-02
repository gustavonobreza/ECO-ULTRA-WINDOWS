$MinimumRefreshRate = 60; # 60hz
$EconomyModeWindows = "scheme_max" # Economy mode
$BrightnessPercent = 0
# Disable dedicated GPU #get you GPU ID reading: https://dev.to/muhammedziyad/automatically-disable-and-enable-your-gpu-or-any-other-device-when-your-laptop-power-state-changes-hf5
$GPU_ID = "PCI\VEN_10DE&DEV_1F9D&SUBSYS_143E1025&REV_A1\4&2F204912&0&0008";


# Enable 60hz mode in screnn
Invoke-Expression ($PSScriptRoot + ".\QRes.exe /r:${MinimumRefreshRate}"); 

# Enable EcoMode in Windows
powercfg /setactive ${EconomyModeWindows}

# Disable dedicated GPU
pnputil /disable-device ${GPU_ID}

# Set Brightness to minimum
WMIC /NAMESPACE:\\root\wmi PATH WmiMonitorBrightnessMethods WHERE "Active=TRUE" CALL WmiSetBrightness Brightness=${BrightnessPercent} Timeout=0

# Kill not necessaries processes
Invoke-Expression (Stop-Service -Name Rainmeter) | Out-Null
Invoke-Expression (Stop-Service -Name Discord) | Out-Null
Invoke-Expression (Stop-Service -Name EpicGamesLauncher) | Out-Null
Invoke-Expression (Stop-Service -Name RiotClientServices) | Out-Null
Invoke-Expression (Stop-Service -Name WslService -Force) | Out-Null
Invoke-Expression (Stop-Service -Name WSearch) | Out-Null
