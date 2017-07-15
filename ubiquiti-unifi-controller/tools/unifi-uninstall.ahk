WinWait, UniFi Uninstall,,20
IfNotEqual, ErrorLevel, 0, exit 1
ControlSend,, !y, UniFi Uninstall