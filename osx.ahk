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

;------------------------------------------------------------------------------
; Fix for -ign instead of -ing.
; Words to exclude: (could probably do this by return without rewrite)
; From: http://www.morewords.com/e nds-with/gn/
;------------------------------------------------------------------------------

#Hotstring B0  ; Turns off automatic backspacing for the following hotstrings.
; Can be suffix exceptions, too, but should correct "-aling" without correcting "-align".

::align::
::antiforeign::
::arraign::
::assign::
::benign::
:?:campaign:: ; covers "countercampaign". no such words as -campaing
::champaign::
::codesign::
::coign::
::condign::
::consign::
::coreign::
::cosign::
;::countercampaign::
::countersign::
::deign::
::deraign::
::design::
::eloign::
::ensign::
::feign::
::foreign::
::indign::
::malign::
::misalign::
::outdesign::
::overdesign::
::preassign::
::realign::
::reassign::
::redesign::
::reign::
::resign::
::sign::
::sovereign::
::unalign::
::unbenign::
::verisign::
return  ; This makes the above hotstrings do nothing so that they override the ign->ing rule below.

#Hotstring B  ; Turn back on automatic backspacing for all subsequent hotstrings.
:?:ign::ing

;-------------------------------------------------------------------------------
; Common Acronyms to Capitalise
; Move the ones you want in effect, above the commented section (/* .. */)
; NOTE, care should be taken when making use of any these, as some of these could clash with command line entries (e.g. "cd" in Linux to change directory)
;-------------------------------------------------------------------------------
; 

#IfWinActive ahk_exe Teams.exe
::usb::USB ; Universal Serial Bus
::i::I ; I
::teh::the ; the
return
