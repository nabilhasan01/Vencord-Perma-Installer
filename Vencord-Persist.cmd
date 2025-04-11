@echo off
set VENCORD=C:\Vencord\vencord
set DISCORD_UPDATE=%localappdata%\Discord\Update.exe

tasklist | findstr /I "Discord.exe" >nul
if %errorlevel% equ 0 (
    echo Found running Discord process. Terminating...
    taskkill /F /IM Discord.exe
    timeout /t 5 >nul
)

%VENCORD% -update-self
%VENCORD% -install -branch stable
%DISCORD_UPDATE% --processStart Discord.exe
exit