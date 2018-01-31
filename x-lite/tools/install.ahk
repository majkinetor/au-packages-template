WinWait, X-Lite Setup
WinActivate, X-Lite Setup
WinWaitActive, X-Lite Setup
if ErrorLevel
{
    MsgBox, WinWait timed out.
    return
}
SetKeyDelay, 0, 50

; Check "I accept the terms in the Licence Agreement"
SendInput {Tab}
SendInput {Tab}
SendInput {Space}

; Click "Accept" button
SendInput {Tab}
SendInput {Tab}
SendInput {Space}

WinWaitClose