Attribute VB_Name = "IdleCheck"
'*********************************************************************
' Program created by Pete Bradley   QuietGuyia@aol.com
' Function sysidle will return true if system is idle
' and false if system is not idle
'*********************************************************************
Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Dim isidle As Boolean ' system idle
Dim kidle As Boolean ' keyboard idle
Dim midle As Boolean ' mouse idle
Dim idlec As Integer 'idle counter
Dim midlec As Integer 'mouse idle counter
Dim cx As Integer 'initial mouse pos
Dim cy As Integer 'initial mouse pos
Public Type POINTAPI
    x As Long
    y As Long
End Type
Public Function GetX() As Long
    Dim n As POINTAPI
    GetCursorPos n
    GetX = n.x
End Function
Public Function GetY() As Long
    Dim n As POINTAPI
    GetCursorPos n
    GetY = n.y
End Function
Function sysidle() As Boolean
Dim dx As Integer
Dim dy As Integer
'keyboard idle check
    For I = 1 To 256               'checks all keys for status
      state = GetAsyncKeyState(I)
     If state = -32767 Then        ' this value is ret if key is down
       kidle = False
       idlec = 0
       Exit For
     End If
    Next I
    If state <> -32767 Then
     idlec = idlec + 1
    End If
    If idlec > 20 Then             ' 20 is a lil delay, other wise no time to
       kidle = True                ' run idle rtns
    End If
'end keyboard idle check
'begin mouse idle check
dx = GetX
dy = GetY
If cx <> dx And cy <> dy Then
   midle = False
   midlec = 0
End If
If cx = dx And cy = dy Then
   midlec = midlec + 1
End If
If midlec > 20 Then
   midle = True
End If
'end mouse idle check
cx = GetX
cy = GetY
If kidle Or midle Then sysidle = True
If Not kidle Or Not midle Then sysidle = False
End Function
