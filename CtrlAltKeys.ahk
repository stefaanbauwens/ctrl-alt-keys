
#Persistent
gui +lastfound
currentwnd := winexist()

DllCall( "RegisterShellHookWindow" , UInt , currentwnd )
messagecall := DllCall( "RegisterWindowMessage" , Str , "SHELLHOOK" )
OnMessage( messagecall , "newshellmessage" )

percent := "%"

inifilename := A_ScriptFullPath
stringtrimright,inifilename,inifilename,4
inifilename := inifilename . ".ini"
menu,tray,nostandard
menu,tray,deleteall
menu,tray,add,Stop AxCrypt,axcryptstop
menu,tray,add
menu,tray,add,Show help page 1 (programs),showpage1
menu,tray,add,Show help page 2 (screen parts),showpage2
menu,tray,add,Show help page 3 (window),showpage3
menu,tray,add,Show help page 4 (sound),showpage4
menu,tray,add
menu,tray,add,Exit CtrlAltKeys,menuexit
menu,tray,tip,CONTROL + ALT + H = Show help (4 pages)
savedprevious = 0
pressedprevious = numpad5
windowprevious = 0
transcolorcode = 0xFFFFFF
helppage = 1
hotkey,^<!lwin,verifycurrentwindow
hotkey,^<!t,keythunderbird
hotkey,^<!e,keyexcel
hotkey,^<!c,keychrome
hotkey,^<!i,keyiexplore
hotkey,^<!f,keyfirefox
hotkey,^<!w,keyword
hotkey,^<!o,keyopera
hotkey,^<!n,keynotepadpp
hotkey,^<!numpaddiv,keysetcolor
hotkey,^<!numpadmult,keytranscolor
hotkey,^<!numpadsub,keyminimize
hotkey,^<!numpadadd,keymaximize
hotkey,^<!numpad0,key0
hotkey,^<!numpad1,key1
hotkey,^<!numpad2,key2
hotkey,^<!numpad3,key3
hotkey,^<!numpad4,key4
hotkey,^<!numpad5,key5
hotkey,^<!numpad6,key6
hotkey,^<!numpad7,key7
hotkey,^<!numpad8,key8
hotkey,^<!numpad9,key9
hotkey,^<!left,keyleft
hotkey,^<!right,keyright
hotkey,^<!up,keyup
hotkey,^<!down,keydown
hotkey,^<!space,keyspace
hotkey,^<!F1,keyF1
hotkey,^<!F2,keyF2
hotkey,^<!F3,keyF3
hotkey,^<!F4,keyF4
hotkey,^<!F5,keyF5
hotkey,^<!F6,keyF6
hotkey,^<!F7,keyF7
hotkey,^<!F8,keyF8
hotkey,^<!F9,keyF9
hotkey,^<!F10,keyF10
hotkey,^<!F11,keyF11
hotkey,^<!F12,keyF12
hotkey,^<!?,showhelp
hotkey,^<!h,showhelp
stateaxcrypt := 0
gosub lockchange
menu,tray,disable,Stop AxCrypt
loop
{
  process,wait,axcrypt.exe
  stateaxcrypt := 1
  gosub lockchange
  menu,tray,enable,Stop AxCrypt
  process,waitclose,axcrypt.exe
  stateaxcrypt := 0
  gosub lockchange
  menu,tray,disable,Stop AxCrypt
}
return

~numlock::
  keywait,numlock
  goto lockchange
~capslock::
  keywait,capslock
  goto lockchange
~lshift::
  keywait,lshift
  goto lockchange
~rshift::
  keywait,rshift
  goto lockchange
~scrolllock::
  keywait,scrolllock

lockchange:
  statenum := getkeystate("numlock","T")
  statecaps := getkeystate("capslock","T")
  statescroll := getkeystate("scrolllock","T")
  stateicon := statescroll + statenum * 2 + statecaps * 4
  menu,tray,icon,traystate%stateaxcrypt%%stateicon%.ico,1
  return

showpage1:
  helppage = 1
  goto showhelp
showpage2:
  helppage = 2
  goto showhelp
showpage3:
  helppage = 3
  goto showhelp
showpage4:
  helppage = 4

showhelp:
  Gui new, +border -sysmenu
  if (helppage = 4)
  {
    Gui Add, Text, x10  y10  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y30  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y50  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y70  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y90  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y110 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y130 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y150 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y170 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y190 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y210 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y230 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y250 w120 h23 +0x200, CONTROL
    Gui Add, Text, x70  y10  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y30  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y50  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y70  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y90  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y110 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y130 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y150 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y170 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y210 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y230 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y250 w120 h23 +0x200, ALT
    Gui Add, Text, x100 y10  w120 h23 +0x200, SPACE
    Gui Add, Text, x100 y30  w120 h23 +0x200, F1
    Gui Add, Text, x100 y50  w120 h23 +0x200, F2
    Gui Add, Text, x100 y70  w120 h23 +0x200, F3
    Gui Add, Text, x100 y90  w120 h23 +0x200, F4
    Gui Add, Text, x100 y110 w120 h23 +0x200, F5
    Gui Add, Text, x100 y130 w120 h23 +0x200, F6
    Gui Add, Text, x100 y150 w120 h23 +0x200, F7
    Gui Add, Text, x100 y170 w120 h23 +0x200, F8
    Gui Add, Text, x100 y190 w120 h23 +0x200, F9
    Gui Add, Text, x100 y210 w120 h23 +0x200, F10
    Gui Add, Text, x100 y230 w120 h23 +0x200, F11
    Gui Add, Text, x100 y250 w120 h23 +0x200, F12
    Gui Add, Text, x150 y10  w180 h23 +0x200, = microphone mute
    Gui Add, Text, x150 y30  w180 h23 +0x200, = master volume 5%percent%
    Gui Add, Text, x150 y50  w180 h23 +0x200, = master volume 10%percent%
    Gui Add, Text, x150 y70  w180 h23 +0x200, = master volume 15%percent%
    Gui Add, Text, x150 y90  w180 h23 +0x200, = master volume 20%percent%
    Gui Add, Text, x150 y110 w180 h23 +0x200, = master volume 25%percent%
    Gui Add, Text, x150 y130 w180 h23 +0x200, = master volume 30%percent%
    Gui Add, Text, x150 y150 w180 h23 +0x200, = master volume 35%percent%
    Gui Add, Text, x150 y170 w180 h23 +0x200, = master volume 40%percent%
    Gui Add, Text, x150 y190 w180 h23 +0x200, = master volume 45%percent%
    Gui Add, Text, x150 y210 w180 h23 +0x200, = master volume 50%percent%
    Gui Add, Text, x150 y230 w180 h23 +0x200, = master volume 55%percent%
    Gui Add, Text, x150 y250 w180 h23 +0x200, = master volume 60%percent%
    Gui Show, w260 h280 center, CtrlAltKeys (Help)
    helppage = 1
  }
  else if (helppage = 3)
  {
    Gui Add, Text, x10  y10  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y30  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y50  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y70  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y90  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y110 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y130 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y150 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y170 w120 h23 +0x200, CONTROL
    Gui Add, Text, x70  y10  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y30  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y50  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y70  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y90  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y110 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y130 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y150 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y170 w120 h23 +0x200, ALT
    Gui Add, Text, x100 y10  w120 h23 +0x200, LEFT
    Gui Add, Text, x100 y30  w120 h23 +0x200, RIGHT
    Gui Add, Text, x100 y50  w120 h23 +0x200, UP
    Gui Add, Text, x100 y70  w120 h23 +0x200, DOWN
    Gui Add, Text, x100 y90  w120 h23 +0x200, 0 (num)
    Gui Add, Text, x100 y110 w120 h23 +0x200, / (num)
    Gui Add, Text, x100 y130 w120 h23 +0x200, * (num)
    Gui Add, Text, x100 y150 w120 h23 +0x200, - (num)
    Gui Add, Text, x100 y170 w120 h23 +0x200, + (num)
    Gui Add, Text, x150 y10  w180 h23 +0x200, = move window to left monitor
    Gui Add, Text, x150 y30  w180 h23 +0x200, = move window to right monitor
    Gui Add, Text, x150 y50  w180 h23 +0x200, = set as topmost window
    Gui Add, Text, x150 y70  w180 h23 +0x200, = unset as topmost window
    Gui Add, Text, x150 y90  w180 h23 +0x200, = maximize window
    Gui Add, Text, x150 y110 w180 h23 +0x200, = set transparency color
    Gui Add, Text, x150 y130 w180 h23 +0x200, = activate/deactivate transparency
    Gui Add, Text, x150 y150 w180 h23 +0x200, = minimize all windows
    Gui Add, Text, x150 y170 w180 h23 +0x200, = undo minimize all windows
    Gui Show, w327 h200 center, CtrlAltKeys (Help)
    helppage = 4
  }
  else if (helppage = 2)
  {
    Gui Add, Text, x10  y10  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y30  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y50  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y70  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y90  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y110 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y130 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y150 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y170 w120 h23 +0x200, CONTROL
    Gui Add, Text, x70  y10  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y30  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y50  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y70  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y90  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y110 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y130 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y150 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y170 w120 h23 +0x200, ALT
    Gui Add, Text, x100 y10  w120 h23 +0x200, 1 (num)
    Gui Add, Text, x100 y30  w120 h23 +0x200, 2 (num)
    Gui Add, Text, x100 y50  w120 h23 +0x200, 3 (num)
    Gui Add, Text, x100 y70  w120 h23 +0x200, 4 (num)
    Gui Add, Text, x100 y90  w120 h23 +0x200, 5 (num)
    Gui Add, Text, x100 y110 w120 h23 +0x200, 6 (num)
    Gui Add, Text, x100 y130 w120 h23 +0x200, 7 (num)
    Gui Add, Text, x100 y150 w120 h23 +0x200, 8 (num)
    Gui Add, Text, x100 y170 w120 h23 +0x200, 9 (num)
    Gui Add, Text, x150 y10  w180 h23 +0x200, = left bottom part
    Gui Add, Text, x150 y30  w180 h23 +0x200, = center bottom part
    Gui Add, Text, x150 y50  w180 h23 +0x200, = right bottom part
    Gui Add, Text, x150 y70  w180 h23 +0x200, = left full screen
    Gui Add, Text, x150 y90  w180 h23 +0x200, = center full screen
    Gui Add, Text, x150 y110 w180 h23 +0x200, = right full screen
    Gui Add, Text, x150 y130 w180 h23 +0x200, = left upper part
    Gui Add, Text, x150 y150 w180 h23 +0x200, = center upper part
    Gui Add, Text, x150 y170 w180 h23 +0x200, = right upper part
    Gui Show, w256 h200 center, CtrlAltKeys (Help)
    helppage = 3
  }
  else if (helppage = 1)
  {
    Gui Add, Text, x10  y10  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y30  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y50  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y70  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y90  w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y110 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y130 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y150 w120 h23 +0x200, CONTROL
    Gui Add, Text, x10  y170 w120 h23 +0x200, CONTROL
    Gui Add, Text, x70  y10  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y30  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y50  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y70  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y90  w120 h23 +0x200, ALT
    Gui Add, Text, x70  y110 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y130 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y150 w120 h23 +0x200, ALT
    Gui Add, Text, x70  y170 w120 h23 +0x200, ALT
    Gui Add, Text, x100 y10  w120 h23 +0x200, T
    Gui Add, Text, x100 y30  w120 h23 +0x200, E
    Gui Add, Text, x100 y50  w120 h23 +0x200, C
    Gui Add, Text, x100 y70  w120 h23 +0x200, I
    Gui Add, Text, x100 y90  w120 h23 +0x200, F
    Gui Add, Text, x100 y110 w120 h23 +0x200, W
    Gui Add, Text, x100 y130 w120 h23 +0x200, O
    Gui Add, Text, x100 y150 w120 h23 +0x200, N
    Gui Add, Text, x100 y170 w120 h23 +0x200, LOGO (left)
    Gui Add, Text, x170 y10  w200 h23 +0x200, = activate Thunderbird
    Gui Add, Text, x170 y30  w200 h23 +0x200, = activate Excel/Calc
    Gui Add, Text, x170 y50  w200 h23 +0x200, = activate Chrome
    Gui Add, Text, x170 y70  w200 h23 +0x200, = activate Internet Explorer
    Gui Add, Text, x170 y90  w200 h23 +0x200, = activate Firefox
    Gui Add, Text, x170 y110 w200 h23 +0x200, = activate Word/Writer
    Gui Add, Text, x170 y130 w200 h23 +0x200, = activate Opera
    Gui Add, Text, x170 y150 w200 h23 +0x200, = activate Notepad++
    Gui Add, Text, x170 y170 w200 h23 +0x200, = save/delete current window postion
    Gui Show, w360 h200 center, CtrlAltKeys (Help)
    helppage = 2
  }
  sleep 5000
  gui Destroy
  return

menuexit:
  exitapp

keysetcolor:
  mousegetpos,mousex,mousey
  pixelgetcolor,transcolorcode,mousex,mousey,RGB
  return
keytranscolor:
  winget,checkcolor,transcolor,A
  checklength := strlen(checkcolor)
  if (checklength > 0)
    winset,transcolor,off,A
  else
    winset,transcolor,%transcolorcode%,A
  return

keyup:
  winset,alwaysontop,on,A
  return
keydown:
  winset,alwaysontop,off,A
  return

keyminimize:
  winminimizeall
  return
keymaximize:
  winminimizeallundo
  return

keyspace:
  soundset, +1, microphone, mute
  return
keyF1:
  soundset, 5, master, volume
  return
keyF2:
  soundset, 10, master, volume
  return
keyF3:
  soundset, 15, master, volume
  return
keyF4:
  soundset, 20, master, volume
  return
keyF5:
  soundset, 25, master, volume
  return
keyF6:
  soundset, 30, master, volume
  return
keyF7:
  soundset, 35, master, volume
  return
keyF8:
  soundset, 40, master, volume
  return
keyF9:
  soundset, 45, master, volume
  return
keyF10:
  soundset, 50, master, volume
  return
keyF11:
  soundset, 55, master, volume
  return
keyF12:
  soundset, 60, master, volume
  return
  
keythunderbird:
  execlass = MozillaWindowClass
  exename = ^thunderbird\.exe$
  goto showandactivate
keyexcel:
  execlass = XLMAIN|SALFRAME
  exename = ^excel\.exe$|.*Calc$
  goto showandactivate
keychrome:
  execlass = Chrome_WidgetWin_1
  exename = ^chrome\.exe$
  goto showandactivate
keyiexplore:
  execlass = IEFrame
  exename = ^iexplore\.exe$
  goto showandactivate
keyfirefox:
  execlass = MozillaWindowClass
  exename = ^firefox\.exe$
  goto showandactivate
keyword:
  execlass = OpusApp|SALFRAME
  exename = ^winword\.exe$|.*Writer$
  goto showandactivate
keyopera:
  execlass = Chrome_WidgetWin_1
  exename = ^opera\.exe$
  goto showandactivate
keynotepadpp:
  execlass = Notepad++
  exename = ^notepad[+][+]\.exe$

showandactivate:
  winget,listid,list
  loop,%listid%
  {
    windowid := listid%A_Index%
    wingetclass,windowclass,ahk_id %windowid%
    if (regexmatch(windowclass,execlass) = 1)
    {
      winget,windowprocess,processname,ahk_id %windowid%
      stringlower,windowprocess,windowprocess
      if (windowprocess = "soffice.bin")
         wingettitle,windowprocess,ahk_id %windowid%
      if (regexmatch(windowprocess,exename) = 1)
        WinActivate,ahk_id %windowid%
    }
  }
  return

key0:
  pressednew = numpad0
  winget,windowprevious,ID,A
  winget,checkmaximize,minmax,A
  if (checkmaximize = 1)
    winrestore,A
  else
    winmaximize,A
  goto positioningreturn

key1:
  pressednew = numpad1
  goto positioningstart
key2:
  pressednew = numpad2
  goto positioningstart
key3:
  pressednew = numpad3
  goto positioningstart
key4:
  pressednew = numpad4
  goto positioningstart
key5:
  pressednew = numpad5
  goto positioningstart
key6:
  pressednew = numpad6
  goto positioningstart
key7:
  pressednew = numpad7
  goto positioningstart
key8:
  pressednew = numpad8
  goto positioningstart
key9:
  pressednew = numpad9

positioningstart:
  forcemaximize := 0
  winget,windowprevious,ID,A
  wingetpos,activeleft,activetop,activewidth,activeheight,A
  monitornew := 1
  checkcenterx := activeleft + (activewidth / 2)
  checkcentery := activetop + (activeheight / 2)
  sysget,monitorcount,monitorcount
  Loop %monitorcount%
  {
    sysget,monitor,monitorworkarea,%A_Index%
    if (checkcenterx > monitorleft and checkcenterx < monitorright and checkcentery > monitortop and checkcentery < monitorbottom )
      monitornew := A_Index
  }

positioningcontinue:
  sysget,screen,monitorworkarea,%monitornew%
  widthfull := screenright - screenleft
  heightfull := screenbottom - screentop
  widthhalf := widthfull / 2
  heighthalf := heightfull / 2
  widththird := widthfull / 3
  heightthird := heightfull / 3
  widthquarter := widthfull / 4
  if (pressednew = "numpad7")
  {
    pressednew = set7size2
    if (activetop = screentop and activeheight = heighthalf and activeleft = screenleft and activewidth = widthhalf)
      pressednew = set7size3
    if (activetop = screentop and activeheight = heighthalf and activeleft = screenleft and activewidth = widththird)
      pressednew = set7size4
  }
  if (pressednew = "set7size2" or pressednew = "set7size3" or pressednew = "set7size4")
  {
    newleft := screenleft
    newtop := screentop
    newheight := heighthalf
    newwidth := widthhalf
    if (pressednew = "set7size3")
      newwidth := widththird
    if (pressednew = "set7size4")
      newwidth := widthquarter
  }
  if (pressednew = "numpad4")
  {
    pressednew = set4size2
    if (activetop = screentop and activeheight = heightfull and activeleft = screenleft and activewidth = widthhalf)
      pressednew = set4size3
    if (activetop = screentop and activeheight = heightfull and activeleft = screenleft and activewidth = widththird)
      pressednew = set4size4
  }
  if (pressednew = "set4size2" or pressednew = "set4size3" or pressednew = "set4size4")
  {
    newleft := screenleft
    newtop := screentop
    newheight := heightfull
    newwidth := widthhalf
    if (pressednew = "set4size3")
      newwidth := widththird
    if (pressednew = "set4size4")
      newwidth := widthquarter
  }
  if (pressednew = "numpad1")
  {
    pressednew = set1size2
    checktop := screentop + heighthalf
	if (activetop = checktop and activeheight = heighthalf and activeleft = screenleft and activewidth = widthhalf)
      pressednew = set1size3
    if (activetop = checktop and activeheight = heighthalf and activeleft = screenleft and activewidth = widththird)
      pressednew = set1size4
  }
  if (pressednew = "set1size2" or pressednew = "set1size3" or pressednew = "set1size4")
  {
    newleft := screenleft
    newtop := screentop + heighthalf
    newheight := heighthalf
    newwidth := widthhalf
    if (pressednew = "set1size3")
      newwidth := widththird
    if (pressednew = "set1size4")
      newwidth := widthquarter
  }
  if (pressednew = "numpad9")
  {
    pressednew = set9size2
    if (activetop = screentop and activeheight = heighthalf and activeleft = screenleft + widthfull - widthhalf and activewidth = widthhalf)
      pressednew = set9size3
    if (activetop = screentop and activeheight = heighthalf and activeleft = screenleft + widthfull - widththird and activewidth = widththird)
      pressednew = set9size4
  }
  if (pressednew = "set9size2" or pressednew = "set9size3" or pressednew = "set9size4")
  {
    newtop := screentop
    newheight := heighthalf
    newwidth := widthhalf
    if (pressednew = "set9size3")
      newwidth := widththird
    if (pressednew = "set9size4")
      newwidth := widthquarter
    newleft := screenleft + widthfull - newwidth
  }
  if (pressednew = "numpad6")
  {
    pressednew = set6size2
    if (activetop = screentop and activeheight = heightfull and activeleft = screenleft + widthfull - widthhalf and activewidth = widthhalf)
      pressednew = set6size3
    if (activetop = screentop and activeheight = heightfull and activeleft = screenleft + widthfull - widththird and activewidth = widththird)
      pressednew = set6size4
  }
  if (pressednew = "set6size2" or pressednew = "set6size3" or pressednew = "set6size4")
  {
    newtop := screentop
    newheight := heightfull
    newwidth := widthhalf
    if (pressednew = "set6size3")
      newwidth := widththird
    if (pressednew = "set6size4")
      newwidth := widthquarter
    newleft := screenleft + widthfull - newwidth
  }
  if (pressednew = "numpad3")
  {
    pressednew = set3size2
    checktop := screentop + heighthalf
    if (activetop = checktop and activeheight = heighthalf and activeleft = screenleft + widthfull - widthhalf and activewidth = widthhalf)
      pressednew = set3size3
    if (activetop = checktop and activeheight = heighthalf and activeleft = screenleft + widthfull - widththird and activewidth = widththird)
      pressednew = set3size4
  }
  if (pressednew = "set3size2" or pressednew = "set3size3" or pressednew = "set3size4")
  {
    newtop := screentop + heighthalf
    newheight := heighthalf
    newwidth := widthhalf
    if (pressednew = "set3size3")
      newwidth := widththird
    if (pressednew = "set3size4")
      newwidth := widthquarter
    newleft := screenleft + widthfull - newwidth
  }
  if (pressednew = "numpad8")
  {
    pressednew = set8size1
    if (activetop = screentop and activeheight = heighthalf and activeleft = screenleft and activewidth = widthfull)
      pressednew = set8size2
    if (activetop = screentop and activeheight = heighthalf and activeleft = screenleft + widthquarter and activewidth = widthhalf)
      pressednew = set8size3
  }
  if (pressednew = "set8size1" or pressednew = "set8size2" or pressednew = "set8size3")
  {
    newtop := screentop
    newheight := heighthalf
    newwidth := widthfull
    if (pressednew = "set8size2")
      newwidth := widthhalf
    if (pressednew = "set8size3")
      newwidth := widththird
    newleft := widthfull - newwidth
    newleft := newleft / 2
    newleft := screenleft + newleft
  }
  if (pressednew = "numpad5")
  {
    pressednew = set5size1
    if (activetop = screentop and activeheight = heightfull and activeleft = screenleft and activewidth = widthfull)
      pressednew = set5size2
    if (activetop = screentop and activeheight = heightfull and activeleft = screenleft + widthquarter and activewidth = widthhalf)
      pressednew = set5size3
  }
  if (pressednew = "set5size1" or pressednew = "set5size2" or pressednew = "set5size3")
  {
    newtop := screentop
    newheight := heightfull
    newwidth := widthfull
    if (pressednew = "set5size2")
      newwidth := widthhalf
    if (pressednew = "set5size3")
      newwidth := widththird
    newleft := widthfull - newwidth
    newleft := newleft / 2
    newleft := screenleft + newleft
  }
  if (pressednew = "numpad2")
  {
    pressednew = set2size1
    checktop := screentop + heighthalf
    if (activetop = checktop and activeheight = heighthalf and activeleft = screenleft and activewidth = widthfull)
      pressednew = set2size2
    if (activetop = checktop and activeheight = heighthalf and activeleft = screenleft + widthquarter and activewidth = widthhalf)
      pressednew = set2size3
  }
  if (pressednew = "set2size1" or pressednew = "set2size2" or pressednew = "set2size3")
  {
    newtop := screentop + heighthalf
    newheight := heighthalf
    newwidth := widthfull
    if (pressednew = "set2size2")
      newwidth := widthhalf
    if (pressednew = "set2size3")
      newwidth := widththird
    newleft := widthfull - newwidth
    newleft := newleft / 2
    newleft := screenleft + newleft
  }
  winget,checkmaximize,minmax,A
  if (checkmaximize = 1)
    winrestore,A
  winmove,A,,%newleft%,%newtop%,%newwidth%,%newheight%
  if (forcemaximize = 1)
    winmaximize,A

positioningreturn:
  pressedprevious = %pressednew%
  return

keyleft:
  pressednew = left
  goto changemonitor
keyright:
  pressednew = right

changemonitor:
  wingetpos,activeleft,activetop,activewidth,activeheight,A
  monitorold := 1
  checkcenterx := activeleft + (activewidth / 2)
  checkcentery := activetop + (activeheight / 2)
  sysget,monitorcount,monitorcount
  Loop %monitorcount%
  {
    sysget,monitor,monitorworkarea,%A_Index%
    if (checkcenterx > monitorleft and checkcenterx < monitorright and checkcentery > monitortop and checkcentery < monitorbottom )
      monitorold := A_Index
  }
  sysget,monitor,monitorworkarea,%monitorold%
  if (pressednew = "left")
    checkcenterx := monitorleft - 100
  if (pressednew = "right")
    checkcenterx := monitorright + 100
  monitornew := 0
  oldleft := monitorleft
  sysget,monitorcount,monitorcount
  Loop %monitorcount%
  {
    sysget,monitor,monitorworkarea,%A_Index%
    if (checkcenterx > monitorleft and checkcenterx < monitorright and checkcentery > monitortop and checkcentery < monitorbottom )
      monitornew := A_Index
  }
  if (monitornew = 0)
    return
  pressednew := pressedprevious
  winget,windownew,ID,A
  if (windowprevious <> windownew)
    pressednew = numpad5
  winget,forcemaximize,minmax,A
  if (forcemaximize = 1)
    winrestore,A
  goto positioningcontinue

verifycurrentwindow:
  winget,windowid,ID,A
  wingetclass,windowclass,ahk_id %windowid%
  winget,windowname,ProcessName,ahk_id %windowid%
  winget,windowpath,ProcessPath,ahk_id %windowid%
  windowsection := windowclass . "|" . windowpath . "|" . windowname
  wingetpos,windowleft,windowtop,windowwidth,windowheight,ahk_id %windowid%
  winget,windowminmax,minmax,ahk_id %windowid%
  checkdata := windowsection . "|" . windowleft . "|" . windowtop . "|" . windowwidth . "|" . windowheight
  if (checkdata = savedprevious)
    goto deletecurrentwindow

savecurrentwindow:
  savedprevious := checkdata
  iniwrite,%windowminmax%,%inifilename%,%windowsection%,MinMax
  iniwrite,%windowleft%,%inifilename%,%windowsection%,Left
  iniwrite,%windowwidth%,%inifilename%,%windowsection%,Width
  iniwrite,%windowtop%,%inifilename%,%windowsection%,Top
  iniwrite,%windowheight%,%inifilename%,%windowsection%,Height
  traytip,CURRENT WINDOW POSITION SAVED,%windowname%,30,1
  return

deletecurrentwindow:
  savedprevious = 0
  inidelete,%inifilename%,%windowsection%
  traytip,CURRENT WINDOW POSITION DELETED,%windowname%,30,1
  return

newshellmessage( wparam , lparam )
{
  Local dummy
  If ( wparam = 1 ) ;  HSHELL_WINDOWCREATED := 1
  {
    windowid := lparam
    SetTimer,newwindowdetected,-1
  }
}

newwindowdetected:
  wingetclass,windowclass,ahk_id %windowid%
  winget,windowname,ProcessName,ahk_id %windowid%
  winget,windowpath,ProcessPath,ahk_id %windowid%
  windowsection := windowclass . "|" . windowpath . "|" . windowname
  iniread,windowminmax,%inifilename%,%windowsection%,MinMax
  if (windowminmax = "ERROR")
    return
  iniread,windowleft,%inifilename%,%windowsection%,Left
  iniread,windowwidth,%inifilename%,%windowsection%,Width
  iniread,windowtop,%inifilename%,%windowsection%,Top
  iniread,windowheight,%inifilename%,%windowsection%,Height
  winget,checkmaximize,minmax,ahk_id %windowid%
  if (checkmaximize = 1)
    winrestore,ahk_id %windowid%
  winmove,ahk_id %windowid%,,%windowleft%,%windowtop%,%windowwidth%,%windowheight%
  if (windowminmax = 1)
    winmaximize,ahk_id %windowid%
  return

axcryptstop:
  run,"C:\Program Files\Axantum\AxCrypt\AxCrypt.exe" -x
  return
