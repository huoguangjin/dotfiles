*Capslock:: {
    Send "{Blind}{LControl down}"
}

*Capslock up:: {
    Send "{Blind}{LControl up}"
    if (A_PRIORKEY = "CapsLock") {
        Send "{Esc}"
    }
}

ToggleCaps() {
    SetStoreCapsLockMode False
    Send "{CapsLock}"
    SetStoreCapsLockMode True
}

LShift & Capslock::ToggleCaps()
LShift & RShift::ToggleCaps()
RShift & LShift::ToggleCaps()

;^+!h::KeyHistory
