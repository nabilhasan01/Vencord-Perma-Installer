@echo off
set VENCORD=C:\Vencord\vencord
set DISCORD_UPDATE=%localappdata%\Discord\Update.exe

%VENCORD% -update-self
%VENCORD% -install -branch stable
%DISCORD_UPDATE% --processStart Discord.exe
exit