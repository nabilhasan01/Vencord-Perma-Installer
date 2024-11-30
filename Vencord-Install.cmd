@echo off
set VENCORD=C:\Vencord\vencord
set VENCORD_PERIST=C:\Vencord\Vencord-Persist.cmd
set DISCORD_UPDATE=%localappdata%\Discord\Update.exe
set STARTUP_PATH=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\

%VENCORD% -update-self
%VENCORD% -install -branch stable
copy /V /Y "%VENCORD_PERIST%" "%STARTUP_PATH%"
%DISCORD_UPDATE% --processStart Discord.exe
exit