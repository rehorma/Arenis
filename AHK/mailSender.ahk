#SingleInstance Force
lastID:=0
actID:=0
SetTitleMatchMode, 2
keystroke:=^Enter

Gui,Add,Text,x20 y15 w40 h13,Count
Gui,Add,Edit,x70 y10 w100 h21 Number vcount,guiCount
Gui,Add,Text,x20 y85 w21 h13,Title:
Gui,Add,Checkbox,Checked x50 y85 w13 h13 vcheckTitle
Gui,Add,Edit,x70 y80 w100 h21 vneedle,guiNeedle
Gui,Add,Text,x20 y50 w21 h13,ms
Gui,Add,Edit,x70 y45 w100 h21 vdelay,guiDelay
Gui,Add,Button,x70 y120 w43 h23 Default gstart,Start
Gui,Add,Button,x120 y120 w43 h23 gPause,Pause
Gui,Add,Button,x170 y120 w43 h23 gReload,Reload

GuiControl, ,guiNeedle,Psaní zprávy
GuiControl, ,guiDelay,3000
GuiControl, ,guiCount,50

Gui,Show,x562 y145 w230 h151 AutoSize,
Return

start:
GUI,submit, nohide
loop, count
{
	if(checkTitle) {
		title:=""
		if(needle=="") {
		checkTitle:=false
		}
		while(not InStr(title, needle)) {
		sleep 1000
		WinGetActiveTitle, title
		}
	}
	actID := WinExist("A")
	while(lastID==actID) {
		sleep 1000
	}
	lastID:=actID
	send, keystroke
	sleep, delay
	
	
GuiControl, ,guiCount,count-A_Index
}
Return
Reload:
Reload
Return
Pause:

Pause
return

GuiClose:
ExitApp
Return

