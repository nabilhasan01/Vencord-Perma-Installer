@echo off
set VENCORD_PATH=C:\Vencord\vencord
set DISCORD_PATH=%localappdata%\Discord\Update.exe
set VENCORD_PERSIST_PATH=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Vencord-Persist.cmd

%VENCORD_PATH% -uninstall -branch stable
del /F "%VENCORD_PERSIST_PATH%"
%DISCORD_PATH% --processStart Discord.exe
exit