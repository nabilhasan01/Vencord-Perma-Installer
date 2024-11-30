@echo off
set VENCORD=C:\Vencord\vencord
set DISCORD_UPDATE=%localappdata%\Discord\Update.exe
set VENCORD_PERSIST=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Vencord-Persist.cmd

%VENCORD% -uninstall -branch stable
del /F "%VENCORD_PERSIST%"
%DISCORD_UPDATE% --processStart Discord.exe
exit