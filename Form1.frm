VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'Kein
   Caption         =   "SpaceFighter"
   ClientHeight    =   2835
   ClientLeft      =   6105
   ClientTop       =   4665
   ClientWidth     =   2745
   ForeColor       =   &H00C0C0C0&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2835
   ScaleWidth      =   2745
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer2 
      Interval        =   3
      Left            =   840
      Top             =   0
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   480
      Top             =   0
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  '2D
      BackColor       =   &H00000000&
      BorderStyle     =   0  'Kein
      Enabled         =   0   'False
      ForeColor       =   &H00FFFFFF&
      Height          =   165
      Left            =   2160
      TabIndex        =   0
      Text            =   "1"
      Top             =   0
      Width           =   615
   End
   Begin VB.Line Line8 
      BorderColor     =   &H00FFFFFF&
      Visible         =   0   'False
      X1              =   2280
      X2              =   2280
      Y1              =   1080
      Y2              =   2280
   End
   Begin VB.Line Line4 
      BorderColor     =   &H00FFFFFF&
      Visible         =   0   'False
      X1              =   1680
      X2              =   1680
      Y1              =   1080
      Y2              =   2280
   End
   Begin VB.Line Line3 
      BorderColor     =   &H00FFFFFF&
      Visible         =   0   'False
      X1              =   1080
      X2              =   1080
      Y1              =   1080
      Y2              =   2280
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00FFFFFF&
      Visible         =   0   'False
      X1              =   480
      X2              =   480
      Y1              =   1080
      Y2              =   2280
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FFFFFF&
      Height          =   255
      Left            =   360
      Shape           =   1  'Quadrat
      Top             =   2520
      Width           =   255
   End
   Begin VB.Line Line7 
      BorderColor     =   &H00FFFFFF&
      Visible         =   0   'False
      X1              =   2160
      X2              =   2400
      Y1              =   960
      Y2              =   960
   End
   Begin VB.Line Line6 
      BorderColor     =   &H00FFFFFF&
      Visible         =   0   'False
      X1              =   1560
      X2              =   1800
      Y1              =   960
      Y2              =   960
   End
   Begin VB.Line Line5 
      BorderColor     =   &H00FFFFFF&
      Visible         =   0   'False
      X1              =   960
      X2              =   1200
      Y1              =   960
      Y2              =   960
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      Visible         =   0   'False
      X1              =   360
      X2              =   600
      Y1              =   960
      Y2              =   960
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim pos As Integer
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyLeft And pos <> 0 Then
pos = pos - 1
Shape1.Left = Shape1.Left - 600
ElseIf KeyCode = vbKeyRight And pos <> 3 Then
pos = pos + 1
Shape1.Left = Shape1.Left + 600
End If
If KeyCode = vbKeySpace Then
    If pos = 0 Then
        Line2.Visible = True
        If Line1.Visible = True Then
            Line1.Visible = False
            Text1.Text = Text1.Text + 1
        End If
    ElseIf pos = 1 Then
        Line3.Visible = True
        If Line5.Visible = True Then
            Line5.Visible = False
            Text1.Text = Text1.Text + 1
        End If
    ElseIf pos = 2 Then
        Line4.Visible = True
        If Line6.Visible = True Then
            Line6.Visible = False
            Text1.Text = Text1.Text + 1
        End If
    ElseIf pos = 3 Then
        Line8.Visible = True
        If Line7.Visible = True Then
            Line7.Visible = False
            Text1.Text = Text1.Text + 1
        End If
    End If
Else
    Line2.Visible = False
    Line3.Visible = False
    Line4.Visible = False
    Line8.Visible = False
End If
End Sub

Private Sub Timer1_Timer()
Dim nr As Integer
nr = Int(Rnd * 4)
If nr = 0 Then
Line1.Visible = True
ElseIf nr = 1 Then
Line5.Visible = True
ElseIf nr = 2 Then
Line6.Visible = True
ElseIf nr = 3 Then
Line7.Visible = True
End If
End Sub

Private Sub Timer2_Timer()
If Line1.Visible = True And Line5.Visible = True And Line6.Visible = True And Line7.Visible = True Then
MsgBox "Game Over" & vbCrLf & "Points:" & Text1.Text, vbDefaultButton1, "SpaceFighter"
Timer2.Enabled = False
End
End If
If Text1.Text Mod 50 = 0 Then
    Timer1.Interval = Timer1.Interval / 2
    Text1.Text = Text1.Text + 1
End If
End Sub
