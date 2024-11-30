@echo off
vencord -update-self
vencord -install -branch stable
%localappdata%\Discord\Update.exe --processStart Discord.exe
exit