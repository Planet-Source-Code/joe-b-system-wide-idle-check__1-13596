VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Is System idle?"
   ClientHeight    =   600
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5325
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   600
   ScaleWidth      =   5325
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   60
      Left            =   -60
      Top             =   -75
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "System is NOT idle"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   75
      TabIndex        =   0
      Top             =   30
      Width           =   5130
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Timer1_Timer()
If sysidle Then Label3 = "SYSTEM IS IDLE"
If Not sysidle Then Label3 = "SYSTEM IS NOT IDLE"
End Sub
