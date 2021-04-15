[Setup]
OutputDir=.
OutputBaseFilename=setup-CtrlAltKeys
AppName=Ctrl Alt Keys
AppVerName=1.1.0
AppId={{96593F43-DA3C-4B58-80B6-220C5B781C88}
DefaultDirName={pf}\CtrlAltKeys
DisableDirPage=true
ShowLanguageDialog=no
UninstallDisplayName=Ctrl Alt Keys
UninstallDisplayIcon={app}\CtrlAltKeys.exe
AppPublisher=SteBaDev
AppVersion=1.1.0
DisableProgramGroupPage=yes

[Files]
Source: CtrlAltKeys.exe; DestDir: {app}
Source: ReadMe.txt; DestDir: {app}
Source: TrayState00.ico; DestDir: {app}
Source: TrayState01.ico; DestDir: {app}
Source: TrayState02.ico; DestDir: {app}
Source: TrayState03.ico; DestDir: {app}
Source: TrayState04.ico; DestDir: {app}
Source: TrayState05.ico; DestDir: {app}
Source: TrayState06.ico; DestDir: {app}
Source: TrayState07.ico; DestDir: {app}
Source: TrayState10.ico; DestDir: {app}
Source: TrayState11.ico; DestDir: {app}
Source: TrayState12.ico; DestDir: {app}
Source: TrayState13.ico; DestDir: {app}
Source: TrayState14.ico; DestDir: {app}
Source: TrayState15.ico; DestDir: {app}
Source: TrayState16.ico; DestDir: {app}
Source: TrayState17.ico; DestDir: {app}
Source: setup-task.xml; DestDir: {tmp}

[Icons]
Name: "{commonstartup}\CtrlAltKeys"; Filename: "{sys}\schtasks.exe"; WorkingDir: "{app}"; Flags: runminimized; IconFilename: "{app}\CtrlAltKeys.exe"; Parameters: "/RUN /TN CtrlAltKeys"; MinVersion: 0,6.0

[Run]
Filename: "{sys}\schtasks.exe"; Parameters: "/CREATE /XML {tmp}\task.xml /TN CtrlAltKeys"; WorkingDir: "{app}"; Flags: runascurrentuser skipifdoesntexist runhidden; MinVersion: 0,6.0
Filename: "{sys}\schtasks.exe"; Parameters: "/RUN /TN CtrlAltKeys"; WorkingDir: "{app}"; Flags: runascurrentuser skipifdoesntexist runhidden; MinVersion: 0,6.0

[ThirdPartySettings]
CompileLogMethod=append
