@echo off
set VENCORD=C:\Vencord\vencord
set VENCORD_PERIST=C:\Vencord\Vencord-Persist.cmd
set DISCORD_UPDATE=%localappdata%\Discord\Update.exe
set STARTUP_PATH=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\

tasklist | findstr /I "Discord.exe" >nul
if %errorlevel% equ 0 (
    echo Found running Discord process. Terminating...
    taskkill /F /IM Discord.exe
    timeout /t 5 >nul
)

%VENCORD% -update-self
%VENCORD% -install -branch stable
copy /V /Y "%VENCORD_PERIST%" "%STARTUP_PATH%"
%DISCORD_UPDATE% --processStart Discord.exe
exit