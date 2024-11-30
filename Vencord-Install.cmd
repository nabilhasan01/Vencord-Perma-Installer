@echo off
vencord -update-self
vencord -install -branch stable
copy /V /Y "C:\Vencord\Vencord-Persist.cmd" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
%localappdata%\Discord\Update.exe --processStart Discord.exe
exit