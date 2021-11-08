@ECHO OFF
CLS
ECHO This window will close automatically, please do not close it manually as tasks are running. This script will need to be run as a local administrator. Please ensure that all of your applications are saved and closed before proceeding with this upgrade. Thank you.
TIMEOUT /T 30
TASKKILL /IM cucimoc.exe /T /F
TASKKILL /IM iexplore.exe /T /F
TASKKILL /IM communicator.exe /T /F
TASKKILL /IM OUTLOOK.exe /T /F
TASKKILL /IM WINWORD.exe /T /F
TASKKILL /IM EXCEL.exe /T /F
TASKKILL /IM POWERPNT.exe /T /F
CLS
ECHO This window will close automatically, please do not close it manually as an upgrade is currently proceeding.
MSIEXEC /X {ACE2FA2E-70F6-4E42-B65A-ACD962ABCC6A} /qn /norestart
Office2010-32BIT\setup.exe /uninstall ProPlus /config ".\proplus.ww\SilentUninstallConfig.xml"
Office2010-64BIT\setup.exe /uninstall ProPlus /config ".\ProPlus.WW\SilentUninstallConfig.xml"
MSIEXEC /X {0d1cbbb9-f4a8-45b6-95e7-202ba61d7af4} /qn /norestart
MSIEXEC /qn /uninstall {0D1CBBB9-F4A8-45B6-95E7-202BA61D7AF4} /norestart
EagleRigsOffice2013withSP1\setup.exe
VPN\anyconnect-win-4.0.00057-pre-deploy-k9.msi /qr
VPN\anyconnect-websecurity-win-4.0.00057-pre-deploy-k9.msi /qr
XCOPY "HSE\HSE Script" "%SYSTEMDRIVE%\HSE Script\"
COPY "HSE\HSE-SYNC.LNK" "%SYSTEMDRIVE%\Users\Public\Desktop"
CLS
ECHO This window will now close and a reboot sequence will initiate. Thank you for your patience.
TIMEOUT /T 10
SHUTDOWN /r /t 60
EXIT