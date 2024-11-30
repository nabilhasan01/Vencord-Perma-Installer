@echo off
vencord -uninstall -branch stable
del /F "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Vencord-Persist.cmd"
%localappdata%\Discord\Update.exe --processStart Discord.exe
exit