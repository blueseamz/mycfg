
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ ��������ͼ���������ʾ��ƽʱ���ء�
#NoTrayIcon 
#p::
	if A_IconHidden = 1
		Menu,Tray,Icon
	else
		Menu,Tray,NoIcon
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Alt+W ����notepad++
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
;~ Ctrl+`����Totalcommand
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
;~ Alt+t�ڵ�ǰ·������cmd����
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

!t::		;ͨ�ô���
	Run cmd, f:\Temp\
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ Ctrl+V ��cmd������Ҳ��Ч
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

	