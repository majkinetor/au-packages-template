; Source Monitor messagebox
SetKeyDelay, 10, 10

WinWait, Source Monitor,,20
IfNotEqual, ErrorLevel, 0, exit 1
ControlSend,, {Enter}, Source Monitor

WinWaitClose ; wait for dialog to close