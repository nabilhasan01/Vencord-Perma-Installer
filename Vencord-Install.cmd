@echo off
set VENCORD_PATH=C:\Vencord\vencord
set DISCORD_PATH=%localappdata%\Discord\Update.exe
set STARTUP_PATH=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\
set VENCORD_PERIST_PATH=%VENCORD_PATH%\Vencord-Persist.cmd

%VENCORD_PATH% -update-self
%VENCORD_PATH% -install -branch stable
copy /V /Y "%VENCORD_PERIST_PATH%" "%STARTUP_PATH%"
%DISCORD_PATH% --processStart Discord.exe
exit