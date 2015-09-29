;
; AutoIt Version: 3.0
; Language:       French
; Platform:       Win9x/NT/XP/7
; Author:        Daniel Reynaud
; Script Function:
;   Decryptage des mdp admin et presta Sogeres
; Comment :
;	Pour ce soft j'ai fait  :
;		Décompilation d'un fichier autoIT
;		Modification de son IHM avec Koda
;		Modification du code et ajout de nouveaux mdp

; bien évidemment, aucune clés n'est affichée sur Github
$PRESTA = "XXX"
$ADMIN = "XXX"
Dim $TOTAL
Dim $PASSWORD
Func SHOWPWD($COMPUTERNAME, $SUF)
	$PASSWORD = ""
	$TAILLE = StringLen($COMPUTERNAME)
	For $I = 1 To $TAILLE + 1
		$CAR = StringMid($COMPUTERNAME, $I, 1)
		$NUM = Asc($CAR)
		$TOTAL = $TOTAL + $NUM
	Next
	$PASSWORD = $TOTAL & $SUF
	$TOTAL = ""
 EndFunc
 Func SHOWPWD2($COMPUTERNAME, $SUF)
	$PASSWORD = ""
	$CLE = "XXX"
	$Car1 = StringMid($COMPUTERNAME, 2, 1)
	$Car2 = StringMid($COMPUTERNAME, 3, 1)
	$Car3 = StringMid($COMPUTERNAME, 4, 1)
	$Car4 = StringMid($COMPUTERNAME, 5, 1)
	$Car5 = StringMid($COMPUTERNAME, 6, 1)
	$Car6 = StringMid($COMPUTERNAME, 7, 1)
	$Car7 = StringMid($COMPUTERNAME, 8, 1)
	$TOTAL = $Car1 + $Car2 + $Car3 + $Car4 + $Car5 + $Car6 + $Car7
	$CLE+$TOTAL
	$PASSWORD = $CLE + $TOTAL 
	$TOTAL = ""
EndFunc

#region ### START Koda GUI section ### Form=
$FORM1 = GUICreate("SOGERES : Mot de passe Poste Admin et Presta ", 370, 300)
$INPUT1 = GUICtrlCreateInput("", 184, 8, 169, 21)
$ORDI = GUICtrlCreateLabel("Ordinateur (XXXXX-..)", 8, 8, 53, 40)
$LABEL1 = GUICtrlCreateLabel("Mot de passe Administrator", 8, 48, 131, 17)
$LABEL2 = GUICtrlCreateLabel("Mot de passe Prestataire", 8, 96, 121, 17)
$ADMINPWD = GUICtrlCreateLabel("Mot de passe Administrator", 184, 48, 154, 19)
GUICtrlSetFont(-1, 10, 800, 0, "Calibri")
GUICtrlSetColor(-1, 16711680)
$PRESTAPWD = GUICtrlCreateLabel("Mot de passe Prestataire", 184, 96, 138, 19)
GUICtrlSetFont(-1, 10, 800, 0, "Calibri")
GUICtrlSetColor(-1, 16711680)

$ORDI2 = GUICtrlCreateLabel("Ordinateur (S500...)", 8, 140, 53, 40)
$INPUT2 = GUICtrlCreateInput("", 184, 140, 169, 21)
$LABEL3 = GUICtrlCreateLabel("Mot de passe Administrator", 8, 180, 131, 17)
$LABEL4 = GUICtrlCreateLabel("Mot de passe Prestataire", 8, 220, 121, 17)
$ADMINPWD2 = GUICtrlCreateLabel("Mot de passe Administrator", 184, 180, 154, 19)
GUICtrlSetFont(-1, 10, 800, 0, "Calibri")
GUICtrlSetColor(-1, 16711680)
$PRESTAPWD2 = GUICtrlCreateLabel("Mot de passe Prestataire", 184, 220, 138, 19)
GUICtrlSetFont(-1, 10, 800, 0, "Calibri")
GUICtrlSetColor(-1, 16711680)

$OK = GUICtrlCreateButton("OK", 64, 260, 73, 25, 0)
$CANCEL = GUICtrlCreateButton("Cancel", 197, 260, 73, 25, 0)
GUISetState(@SW_SHOW)
#endregion ### END Koda GUI section ###
While 1
	$NMSG = GUIGetMsg()
	Switch $NMSG
		Case $CANCEL
			GUISetState(@SW_HIDE)
			Exit
		Case $OK
			$COMP = GUICtrlRead($INPUT1)
			If GUICtrlRead($INPUT1)  <> "" then
				$COMP = StringLower($COMP)
				Call("Showpwd", $COMP, $ADMIN)
				GUICtrlSetData($ADMINPWD, $PASSWORD)
				Call("Showpwd", $COMP, $PRESTA)
				GUICtrlSetData($PRESTAPWD, $PASSWORD)
			EndIf
			
			If GUICtrlRead($INPUT2)  <> "" then
				$Ordi = GUICtrlRead($INPUT2)
				$Ordi = StringLower($Ordi)
				Call("Showpwd2", $Ordi, $ADMIN)
				GUICtrlSetData($ADMINPWD2, $PASSWORD & "XXXX-X*")
				Call("Showpwd2", $Ordi, $PRESTA)
				GUICtrlSetData($PRESTAPWD2, $PASSWORD & "XXXX-X*")
			EndIf
			
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
WEnd
