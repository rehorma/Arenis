#SingleInstance Force
lastID:=0
actID:=0
SetTitleMatchMode, 2
keystroke:="^{Enter}"
GuiTitle:="AHKMailSenderGUI"


Gui,Add,Text,x20 y15 w40 h13,Count
Gui,Add,Edit,x70 y10 w100 h21 Number vcount,guiCount
Gui,Add,Text,x20 y85 w21 h13,Title:
Gui,Add,Checkbox,Checked x50 y85 w13 h13 vcheckTitle
Gui,Add,Edit,x70 y80 w100 h21 vneedle,guiNeedle
Gui,Add,Text,x20 y50 w21 h13,ms
Gui,Add,Edit,x70 y45 w100 h21 vdelay,guiDelay
Gui,Add,Text,x20 y115 w150 h40 vStatus, Ready
Gui,Add,Button,x70 y160 w43 h23 Default gstart,Start
Gui,Add,Button,x120 y160 w43 h23 gPause,Pause
Gui,Add,Button,x170 y160 w43 h23 gReload,Reload

GuiControl, ,Needle,Psaní zprávy
GuiControl, ,Delay,3000
GuiControl, ,Count,50


Gui,Show,x562 y145 w230 h190 AutoSize, %GuiTitle%

Return

start:
GUI,submit, nohide
WinSet, Bottom,, %GuiTitle%
WinActivate, %needle%
WinSet, alwaysontop,On,%GuiTitle%


loop, %count%
{
	idx:=A_Index
	
	if(checkTitle) {
		WinGetActiveTitle, title
		if(needle=="") {
		checkTitle:=false
		}
		while(checkTitle and not InStr(title, needle)) {
		
		GuiControl,,Status,%idx%: waiting for title..%A_Index%
		sleep 1000
		WinGetActiveTitle, title
		}
	}
	actID := WinExist("A")
	
	send, %keystroke%
	
	while(lastID==actID) {
		sleep 1000
		GuiControl,,Status,%idx%: waiting for window to change..%A_Index%
	}	
	lastID:=actID
	sleep, delay
	
	tmp:=%count%-A_Index
GuiControl, ,guiCount,%tmp%
}
Return
Reload:
Reload
Return
Pause:
	Suspend 
	if(Status!="Paused") {
	GuiControlGet,sStatus,,Status
	GuiControl,,Status,Paused
	WinSet, alwaysontop,Off,%GuiTitle%
	}
	else {
	GuiControl,,Status,Paused
	WinSet, alwaysontop,on,%GuiTitle%
	}
	Pause ,, 1
return

GuiClose:
ExitApp
Return


F9::

WinSet, Bottom,, %GuiTitle%
return
F10::

WinSet, alwaysontop,,%GuiTitle%
return

