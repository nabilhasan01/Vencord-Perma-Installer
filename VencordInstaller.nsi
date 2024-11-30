!include "StrFunc.nsh"

Name "Vencord Installer"
OutFile "VencordInstaller.exe"
InstallDir "$PROGRAMFILES\Vencord"

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

    # Add $INSTDIR to system PATH environment variable
    ReadRegStr $0 HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "Path"
    StrCpy $1 "$INSTDIR;"
    StrCpy $2 "$1$0"
    WriteRegExpandStr HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "Path" "$2"
    System::Call 'Kernel32::SendMessageTimeout(i 0xFFFF, i 0x1A, i 0, i "Environment", i 0, i 5000, *i)'
SectionEnd
