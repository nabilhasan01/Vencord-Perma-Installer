@echo off
set VENCORD_PATH=C:\Vencord\vencord
set DISCORD_PATH=%localappdata%\Discord\Update.exe

%VENCORD_PATH% -update-self
%VENCORD_PATH% -install -branch stable
%DISCORD_PATH% --processStart Discord.exe
exit