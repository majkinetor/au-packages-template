; License agreement
SetKeyDelay, 10, 10

WinWait, OzCode Setup, License Agreement
IfNotEqual, ErrorLevel, 0, exit 1

ControlSend,, !a, OzCode Setup

WinWait, OzCode Setup, integration
IfNotEqual, ErrorLevel, 0, exit 1

ControlGet, NextEnabled, Enabled, ,Button2, OzCode Setup ; Check if Next button enabled

If NextEnabled = 0
{
	ControlSend,, {Esc}, OzCode Setup
	
	WinWait, OzCode Setup, Are you sure, 20
	
	ControlSend,, !y, OzCode Setup, Are you sure
	exit 2
}

ControlSend,, !n, OzCode Setup

WinWait, OzCode Setup, Prerequirements, 20
IfNotEqual, ErrorLevel, 0, exit 1

ControlSend,, !n, OzCode Setup
WinWait, OzCode Setup, successfully,20
IfNotEqual, ErrorLevel, 0, exit 1

ControlSend,, !f, OzCode Setup

WinWaitClose ; wait for dialog to close