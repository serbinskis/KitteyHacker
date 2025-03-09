@echo off
title Administrator Check
color 0a

:Check
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting Administrative Privileges...
    echo Запрос Право Администратора...
    goto UACPrompt
) else ( goto Admin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute %0, "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:Admin
title KitteyHacker Uninstall
%SystemRoot%\System32\attrib -h -s "%SystemRoot%"
%SystemRoot%\System32\SchTasks /Delete /TN KitteyHacker /F

%SystemRoot%\System32\REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DisableCAD /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v shutdownwithoutlogon /t REG_DWORD /d 1 /F

%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableChangePassword /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLockWorkstation /F
%SystemRoot%\System32\REG DELETE "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v HideFastUserSwitching /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoLogoff /F
%SystemRoot%\System32\REG DELETE "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDesktop /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoControlPanel /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuPinnedList /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuMorePrograms /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuMyGames /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuMyMusic /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuNetworkPlaces /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideClock /F

%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyComputer /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowControlPanel /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyDocs /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowDownloads /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyGames /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyMusic /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowUser /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyPics /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowRecordedTV /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowVideos /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowSetProgramAccessAndDefaults /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowPrinters /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_EnableDragDrop /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_MenuFavorites /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowHelp /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowNetPlaces /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowHomegroup /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_SearchPrograms /F

%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDrives /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoViewOnDrive /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuPinnedList /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoUserNameInStartMenu /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoNetworkConnections /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuLogoff /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuNetworkPlaces /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuSubFolders /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoCommonGroups /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoFavoritesMenu /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRecentDocsMenu /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoSetFolders /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoAddPrinter /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoFind /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRun /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoSMHelp /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuMorePrograms /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoClose /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoChangeStartMenu /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoSMMMyDocs /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoSMMyPictures /F
%SystemRoot%\System32\REG DELETE "HKEY_CURRENT_USER\Control Panel\Mouse" /v SwapMouseButtons /F

%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v CMD2 /t REG_SZ /d "cmd.exe /C RD /S /Q ""%CD%""" /F 

%SystemRoot%\System32\TASKKILL /F /IM KitteyHacker.exe
start %SystemRoot%\explorer.exe
%SystemRoot%\System32\TIMEOUT /T 3 /NOBREAK
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v CMD1 /t REG_SZ /d "cmd.exe /C RD /S /Q ""%TEMP%""" /F 
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v CMD2 /t REG_SZ /d "cmd.exe /C RD /S /Q ""%CD%""" /F 
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v CMD3 /t REG_SZ /d "cmd.exe /C MD ""%TEMP%"" /F 
%SystemRoot%\System32\shutdown -f -r -t 10
RD /S /Q "%CD%"
RD /S /Q "%TEMP%"
exit