#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;following section mimics command-q and command-w
;behaviour to close windows
#w::^F4
#q::!F4

; Window Management Scripts
; maximum window size to be ctrl + win + alt + m
^#!m::Send #{Up down}{Up up}

;move window to left of screen
; ctrl + win + alt + left
^#!Left::Send #{Left down}{Left up}

;move window to right of screen
; ctrl + win + alt + right
^#!Right::Send #{Right down}{Right up}

; win + backspace = delete
^BS::Send {Delete}

;Browser back and forward
![::Browser_Back
!]::Browser_Forward

; Jump to beginning/end of line
!Left::Send {Home}
!Right::Send {End}

; Jump to beginning/end of document
!Up::Send {Lctrl down}{Home}{Lctrl up}
!Down::Send {Lctrl down}{End}{Lctrl up}

; Selection (uses a combination of the above with shift)
!+Left::Send {shift down}{Home}}{shift up}
!+Right::Send {shift down}{End}}{shift up}
!+Up::Send {Lctrl down}{shift down}{Home}}{shift up}{Lctrl up}
!+Down::Send {Lctrl down}{shift down}{End}}{shift up}{Lctrl up}