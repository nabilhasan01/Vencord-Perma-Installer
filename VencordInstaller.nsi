!include "StrFunc.nsh"

Name "Vencord Perma Installer"
OutFile "VencordPermaInstaller.exe"
InstallDir "C:\Vencord"

Section "Install Vencord"
    CreateDirectory "$INSTDIR"
    File "/oname=$INSTDIR\vencord.exe" "vencord.exe"
    File "/oname=$INSTDIR\Vencord-Install.cmd" "Vencord-Install.cmd"
    File "/oname=$INSTDIR\Vencord-Persist.cmd" "Vencord-Persist.cmd"
    File "/oname=$INSTDIR\Vencord-Uninstall.cmd" "Vencord-Uninstall.cmd"

    # Create Vencord folder in the Start Menu Programs for All Users
    CreateDirectory "$STARTMENU\Vencord"

    # Create shortcuts for Install and Uninstall scripts in the Start Menu
    CreateShortCut "$STARTMENU\Programs\Vencord\Install Vencord.lnk" "$INSTDIR\Vencord-Install.cmd"
    CreateShortCut "$STARTMENU\Programs\Vencord\Uninstall Vencord.lnk" "$INSTDIR\Vencord-Uninstall.cmd"

    # Add Persist script to the Startup folder for the current user
    SetOutPath "$APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
    File "Vencord-Persist.cmd"
SectionEnd