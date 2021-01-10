
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ 控制托盘图标的隐藏显示，平时隐藏。
#NoTrayIcon 
#p::
	if A_IconHidden = 1
		Menu,Tray,Icon
	else
		Menu,Tray,NoIcon
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Alt+W 启动notepad++
!w::
	DetectHiddenWindows, on
	IfWinNotExist ahk_class Notepad++
		Run D:\Program Files\Notepad++\notepad++.exe
	Else
		IfWinNotActive ahk_class Notepad++
		WinActivate
	Else
		WinMinimize
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ Ctrl+`启动Totalcommand
^`::
	DetectHiddenWindows, on
	IfWinNotExist ahk_class TTOTAL_CMD
		Run D:\Program Files\totalcmd\TOTALCMD.EXE
	Else
		IfWinNotActive ahk_class TTOTAL_CMD
		WinActivate
	Else
		WinMinimize
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ Alt+t在当前路径启动cmd窗口
#IfWinActive ahk_class Notepad2
!t::
#IfWinActive ahk_class EmEditorMainFrame3
!t::
#IfWinActive ahk_class EverEdit
!t::
	WinGetTitle title,A
	tpath := ""
	RegExMatch(title, ".*\\", tpath)
	;MsgBox, %tpath%
	Run cmd, %tpath%
return
#IfWinActive

#IfWinActive ahk_class CabinetWClass
!t::
	WinGetTitle title,A
	tpath := title
	;MsgBox, %tpath%
	Run cmd, %tpath%
return
#IfWinActive

#IfWinActive ahk_class TTOTAL_CMD
!t::
	WinGetText title,A
	;MsgBox, %title%
	tpath := ""
	RegExMatch(title, ".*>", tpath)
	StringTrimRight tpath,tpath,1
	;MsgBox, %tpath%
	Run cmd, %tpath%
return
#IfWinActive

!t::		;通用窗口
	Run cmd, f:\Temp\
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ Ctrl+V 在cmd窗口中也有效
#IfWinActive ahk_class ConsoleWindowClass
^v::
#IfWinActive ahk_class VanDyke Software - SecureCRT
^v::
	MouseGetPos nowX,nowY
	MouseMove 50,150,0
	MouseClick Right,,,,0
	Send p
	MouseMove %nowX%,%nowY%,0
return
#IfWinActive
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	