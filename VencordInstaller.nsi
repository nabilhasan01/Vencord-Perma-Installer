!include "StrFunc.nsh"

Name "Vencord Installer"
OutFile "VencordInstaller.exe"
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
    CreateShortCut "$STARTMENU\Vencord\Install Vencord.lnk" "$INSTDIR\Vencord-Install.cmd"
    CreateShortCut "$STARTMENU\Vencord\Uninstall Vencord.lnk" "$INSTDIR\Vencord-Uninstall.cmd"

    # Add Persist script to the Startup folder for the current user
    SetOutPath "$APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
    File "Vencord-Persist.cmd"

    ; Check if the path entry already exists and write result to $0
    nsExec::Exec 'echo %PATH% | find "C:\Vencord"'
    Pop $0   ; gets result code

    ${If} $0 = 0
        nsExec::Exec 'setx PATH=%PATH%;C:\Vencord'
    ${EndIf}
SectionEnd
