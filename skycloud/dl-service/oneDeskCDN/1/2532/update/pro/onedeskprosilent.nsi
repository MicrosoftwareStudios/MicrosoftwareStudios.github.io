;OneDesk
;OneDesk installer Script
;Written by Andrew Oswald

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"
  !define MUI_ICON "onedesk.ico"
  !define MUI_UNICON "onedesk.ico"
  !define MUI_WELCOMEFINISHPAGE_BITMAP "splash.bmp"
  !define MUI_UNWELCOMEFINISHPAGE_BITMAP "splash.bmp"
  !define MUI_WELCOMEPAGE_TEXT "Welcome to the OneDesk setup wizard! This program will help you to install OneDesk 2025 Pro on your computer."
  !define MUI_UNWELCOMEPAGE_TEXT "Are you sure you want to uninstall OneDesk? This program will help you to remove OneDesk 2025 Pro from your computer."
  !define MUI_ABORTWARNING_TEXT "Are you sure you want to quit OneDesk Setup? OneDesk will not be installed!"
  !define MUI_LICENSEPAGE_CHECKBOX_TEXT "I have read and accept the terms of the license agreement"
  !define MUI_LICENSEPAGE_CHECKBOX
  !define MUI_WELCOMEPAGE_TITLE "Welcome to OneDesk Setup!"
  !define MUI_FINISHPAGE_RUN $INSTDIR\onedesk.exe
  !define MUI_FINISHPAGE_RUN_TEXT "Start OneDesk"
  !define MUI_UNWELCOMEPAGE_TITLE "Uninstall OneDesk"
  XPStyle on

;--------------------------------
;General

  ;Name and file
  Name "OneDesk"
  OutFile "updatePKG.exe"
  Unicode True
  RequestExecutionLevel User

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\OneDesk"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\OneDesk" ""

    BrandingText "OneDesk 2025 Pro"
  
;-----------------------------------
;Version Info
  VIProductVersion 3.1.0.1
  VIAddVersionKey /LANG=0 "ProductName" "OneDesk"
  VIAddVersionKey /LANG=0 "CompanyName" "Microsoftware Corporation"
  VIAddVersionKey /LANG=0 "OriginalFilename" "OneDesk32-setup.exe"
  VIAddVersionKey /LANG=0 "LegalCopyright" "  Microsoftware Corporation 2025. All rights reserved."
  VIAddVersionKey /LANG=0 "FileDescription" "Install OneDesk"
  VIAddVersionKey /LANG=0 "ProductVersion" "3.1.0.21"
  VIAddVersionKey /LANG=0 "FileVersion" "3.1.0.21"

;--------------------------------
;Variables

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "pro.rtf"
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_DIRECTORY
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "Install OneDesk Pro" OneDeskInstall
  
  CreateDirectory "$INSTDIR\apps"
  CreateDirectory "$INSTDIR\res"
  CreateDirectory "$INSTDIR\utils"
  CreateDirectory "$INSTDIR\sync"
  CreateDirectory "$INSTDIR\upgrade"
  CreateDirectory "$INSTDIR\update"

  SetOutPath "$INSTDIR\res"
  File "lexdoc.ico"
  File "vertsheet.ico"
  File "organize.ico"
  File "onedesk.ico"

  SetOutPath "$INSTDIR\apps"
  File "Lexica.exe"
  File "Inspira.exe"
  File "organize.exe"
  File "vertex.exe"
  File "orbit.exe"
  File "chatnet.exe"

  SetOutPath "$INSTDIR\upgrade"
  File "upgradeActivation.exe"

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  File "onedesk.exe"
  file "licMgr.exe"
  File "OneDesk.exe.config"
  File "deskUIres.dll"
  File "update.exe"

  ;Store installation folder
  WriteRegStr HKCU "Software\OneDesk" "" $INSTDIR
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\OneDesk" "DisplayName" "OneDesk 2025 Pro"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\OneDesk" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\OneDesk" "Publisher" "Microsoftware Corporation"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\OneDesk" "DisplayIcon" "$\"$INSTDIR\res\onedesk.ico$\""
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\OneDesk" "DisplayVersion" "3.1.0.21"
  WriteRegStr HKCU "Software\OneDesk" "Edition" "Pro"
  WriteRegStr HKCU "Software\OneDesk\ChatNet" "InstallationType" "Integrated"
  WriteRegDword HKCU "Software\OneDesk" "FirstRun" "0x00000001"
  WriteRegDword HKCU "Software\OneDesk" "EOSNotify" "0x00000001"

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

    
    ;Create shortcuts
    CreateShortcut "$SMPROGRAMS\OneDesk.lnk" "$INSTDIR\onedesk.exe"
    CreateShortcut "$DESKTOP\OneDesk.lnk" "$INSTDIR\onedesk.exe"

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_OneDeskInstall 0 "Microsoftware OneDesk"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${OneDeskInstall} $(DESC_OneDeskInstall)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END


;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  Delete "$INSTDIR\onedesk.exe"

  Delete "$INSTDIR\licMgr.exe"

  Delete "$INSTDIR\apps\lexica.exe"

  Delete "$INSTDIR\apps\organize.exe"

  Delete "$INSTDIR\res\organize.ico"

  Delete "$INSTDIR\apps\vertex.exe"

  Delete "$INSTDIR\apps\chatnet.exe"

  Delete "$INSTDIR\apps\orbit.exe"

  Delete "$INSTDIR\key.dat"
  
  Delete "$INSTDIR\deskUIres.dll"

  Delete "$INSTDIR\itemCache.tmp"

  Delete "$INSTDIR\update.exe"

  Delete "$INSTDIR\OneDesk.exe.config"

  Delete "$INSTDIR\res\onedesk.ico"
  
  Delete "$INSTDIR\res\lexdoc.ico"

  Delete "$INSTDIR\res\vertsheet.ico"

  Delete "$INSTDIR\upgrade\upgradeActivation.exe"

  Delete "$INSTDIR\upgrade\upgrade.conf"

  RMDir "$INSTDIR\upgrade"

  RMDir "$INSTDIR\update"

  RMDir "$INSTDIR\res"

  RMDir "$INSTDIR\sync"

  RMDir "$INSTDIR\apps"

  RMDir "$INSTDIR\utils"

  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"

    
  Delete "$SMPROGRAMS\OneDesk.lnk"
  Delete "$DESKTOP\OneDesk.lnk"


  DeleteRegKey HKCU "Software\OneDesk"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\OneDesk"

SectionEnd