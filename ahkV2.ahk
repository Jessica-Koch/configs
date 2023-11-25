#Requires AutoHotkey v2.0

; CONFIGURATION SECTION: Change the below values as desired.
#Warn  ; Enable warnings to assist with detecting common errors.
#UseHook ; Use hook mode for Send and hotstrings.

; These next few performance settings help to keep the action within the
; A_HotkeyModifierTimeout period, and thus avoid the need to release and
; press down the hotkey's modifier if you want to hide more than one
; window in a row. These settings are not needed if you choose to have
; the script use the keyboard hook via InstallKeybdHook or other means:
A_HotkeyModifierTimeout := 100
SetWinDelay 10
SetKeyDelay 0

#SingleInstance  ; Allow only one instance of this script to be running.
Persistent
; END OF CONFIGURATION SECTION (do not make changes below this point
; unless you want to change the basic functionality of the script).

; Following section mimics Command-Q and Command-W behavior to close windows
#q::WinKill "A"
#w::WinClose "A"

;Browser back and forward
^[::Browser_Back
^]::Browser_Forward

; win + backspace = delete
^BS::Del

; Jump to beginning/end of line
!Left::Home
!Right::End

; Jump to beginning/end of document
!Up::Send "{Lctrl down}{Home}{Lctrl up}"
!Down::Send "{Lctrl down}{End}{Lctrl up}"

; Selection (uses a combination of the above with shift)
!+Left::Send "{shift down}{Home}}{shift up}"
!+Right::Send "{shift down}{End}}{shift up}"
!+Up::Send "{Lctrl down}{shift down}{Home}}{shift up}{Lctrl up}"
!+Down::Send "{Lctrl down}{shift down}{End}}{shift up}{Lctrl up}"

;
; Window Management Scripts
;
; Maximum window size to be Ctrl + Win + Alt + M
^#!m::WinMaximize "A"

; Move window to the left of the screen
; Ctrl + Win + Alt + Left
^#!Left::
{
    if WinExist("A") {
        active_id := WinExist("A")
        WinActivate(active_id)
        WinMove(0, 0, A_ScreenWidth/2, A_ScreenHeight, active_id)
    } else {
        ids := WinGetList(,, "Program Manager")
        active_id := ids[0]
        WinActivate(active_id)
        WinMove(0, 0, A_ScreenWidth/2, A_ScreenHeight, active_id)
    }
    
}

; Move window to the right of the screen
; Ctrl + Win + Alt + Right
^#!Right::
{
    if WinExist("A") {
        active_id := WinExist("A")
        WinActivate(active_id)
        WinMove(A_ScreenWidth/2, 0, A_ScreenWidth/2, A_ScreenHeight, active_id)
    } else {
        ids := WinGetList(,, "Program Manager")
        active_id := ids[0]
        WinActivate(active_id)
        WinMove(A_ScreenWidth/2, 0, A_ScreenWidth/2, A_ScreenHeight, active_id)
    }
}
    
