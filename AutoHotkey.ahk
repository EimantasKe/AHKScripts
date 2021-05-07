SetNumlockState, AlwaysOn

^!n::  ; Ctrl+Alt+N
if WinExist("Untitled - Notepad")
    WinActivate
else
    Run Notepad
return

^!g:: ; Ctrl+Alt+g
Run http://www.google.com/search?q=%clipboard% 
Return

::btw::By the way
::@em::eimantas.kezinaitis@mif.vu.lt

; copy text to the clipboard, modify it, paste it back
^+k:: ; ctrl-shift-k
ClipSave:=ClipboardAll ; store current clipboard
Send ^c ; copy selected text
clipboard:="<i>" clipboard "</i>" ; wrap it in html-tags
Send ^v ; paste
Clipboard:=ClipSave ; restore old clipboard content
ClipSave:="" ; clear variable
Return



:*:\td::
	FormatTime, Time,, yyyy-MM-dd
	Send  %Time%
	Return

:*:\tt::
    FormatTime, Time,, HH:mm
    Send %Time%
    Return
   
Capslock::Shift
; RButton::Shift



F10::Send {Volume_Up}
F11::Send {Volume_Down}
F12::Send {Volume_Mute}


#F2::
send Hello World{!}
send {CTRLDOWN}{SHIFTDOWN}{HOME}{CTRLUP}{SHIFTUP}
send {CTRLDOWN}c{CTRLUP}{END}
example = %clipboard%
StringUpper,example,example
sleep, 1000
send, - new hello = %example%
return

^#x:: ;ctrl+win+x
^#c:: ;ctrl+win+c              ; Text-only cut/copy to ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard =
   StringRight x,A_ThisHotKey,1  ; C or X
   Send ^%x%                      ; For best compatibility: SendPlay
   ClipWait 2                    ; Wait for text, up to 2s
   If ErrorLevel
      ClipBoard = %Clip0%        ; Restore original ClipBoard
   Else
      ClipBoard = %ClipBoard%    ; Convert to text
   VarSetCapacity(Clip0, 0)      ; Free memory 
Return