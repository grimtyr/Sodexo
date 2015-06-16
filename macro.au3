#include <Constants.au3>
#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

;
; AutoIt Version: 3.0
; Language:       French
; Platform:       Win9x/NT/XP/7
; Author:        Daniel Reynaud
; Script Function:
;   Macro ITSM
; Comment:
;	ITSM c'est de la merde
#CS                  _
###                  \`\
###        /./././.   | |
###      /        `/. | |
###     /     __    `/'/'
###  /\__/\ /'  `\    /
### |  oo  |      `.,.|
###  \vvvv/        ||||
###    ||||        ||||
###    ||||        ||||
###    `'`'        `'`'
#CE

; fenetre ITSM
Local $hWnd = WinGetHandle("[CLASS:WindowsForms10.Window.8.app.0.2e0c681]")
; requester
Local $requester = "[NAME:SXO_Requester_E02E66CF2D0549128E1DCA540F5990BD]"
; Summary
Local $summary = "[NAME:Subject_3EE42F9F0D934DC2B618460AA779B177]"
; Description
local $desc = "[NAME:Symptom_03B1D38ED2614C0A8AD5FC4D4A2F9035]"
; Diagnostic
Local $diag = "[NAME:SXO_Diagnostic_185FAFE22CCD40F09CA621287DE4DD12]"
; Category
Local $category = "[NAME:Category_3D8DD45F6E2C429F84A9BD4C346C1557]"
; subCategory
Local $subCategory = "[NAME:SubCategory_BF30D5F88F1B4715BE3D643A959A1F96]"
; symptoms =
Local $symptoms = "[NAME:SXO_Incident_Symptoms_702C96FD2A3A4C9FA2C65356DA55F29A]"
; Details
Local $details = "[NAME:SXO_3rdLevelCategoryDetail_A2E2A182834B4EEC987061A636E5711C]"
; resolution code
Local $resolutionCode = "[NAME:CauseCode_49D37E41B763456A837EC2CB37FD04D3]"
;  resolution Method
Local $resolutionMethod = "[NAME:SXO_ReslutionMethod_95C887E89A844E0282FE18B706AD7EA0]"
; resolution
Local $resolution = "[NAME:Resolution_7BDB005F014B4E80AAB5494CA175A5C0]"
; First call resolution
Local $firstCall = "[NAME:FirstCallResolution_87F01DD5CECD4D6E8A7BEE4E585F37E6]"

;~ 8>40>72>104>136>168 (+32)

Local $newSum
Local $newDesc
Local $newDiag
Local $newCategory
Local $newSubCategory
Local $newSymptoms
Local $newResolutionCode
Local $newResolutionMethod
Local $newResolution
Local $newFirstCall

$Form1 = GUICreate("Whiskopy", 615, 438, 192, 124)
$ipSolweb = GUICtrlCreateButton("IP solweb", 8, 8, 137, 25)
$endf = GUICtrlCreateButton("ENDF", 8, 40, 137, 25)
$appelRaccroche = GUICtrlCreateButton("appel raccroché", 8, 72, 137, 25)
$compteNominatif = GUICtrlCreateButton("Compte Nominatif", 8, 104, 137, 25)
$connexionImpossible = GUICtrlCreateButton("Connexion impossible", 8, 136, 137, 25)
; $Button6 = GUICtrlCreateButton("Button3", 8, 168, 137, 25)
GUISetState(@SW_SHOW)

While 1
   $nMsg = GUIGetMsg()
	  Switch $nMsg
		 Case $GUI_EVENT_CLOSE
			Exit
		 Case $ipsolweb
			envoiMacro("Demande de connexion distante solweb","L'utilisateur souhaiterait se connecter à Solweb depuis une connexion hors périmètre (domicile ou cliente)","=> ajout de son adresse IP sur solweb avec son code restaurant OK IP : code site :", "User Software", "SOL", "PROFILE / RIGHTS", "Access Changed", "Phone", "Accès ajouté", "Yes")
		Case $endf
		    envoiMacro("Connexion à ENDF", "L'utilisateur souhaiterait se connecter à sa session ENDF mais ne se souvient plus de ses identifiants", "réinitialisation du mot de passe via le robot", "User Software", "ENOTES DE FRAIS", "LOGIN / PASSWORD", "Password reset", "Phone", "Votre mot de passe a été réinitialisé, vous allez le recevoir par mail d'ici une dizaine de minutes", "Yes")
		Case $appelRaccroche
			envoiMacro("Appel raccroché", "Appel raccroché", "Appel raccroché", "User Software", "OUT OF SCOPE", "OUT OF SCOPE", "No Fault Found", "Phone", "Appel raccroché", "Yes")
;~ 			Sleep(1000)
;~ 			envoiRequester("Nouveau Collaborateur")
			envoiDetail("APPEL RACCROCHE")
		 Case $compteNominatif
			envoiMacro("Migration vers la session nominative", "l'utilisateur n'arrive pas à se connecter à sa session nominative, il n'a plus le mot de passe", "=> réinitialisation du mot de passe", "User Software", "WINDOWS", "LOGIN / PASSWORD", "Password reset", "Phone", "Mot de passe réinitialisé", "No")
		 Case $connexionImpossible
			envoiMacro("Connexion impossible", "l'utilisateur n'a pas accès à internet", "incident national repéré cette nuit", "User Hardware", "ROUTEUR", "HARDWARE FAILURE / OUT OF ORDER", "User Advised", "Phone", "Il s'agit d'un incident général. Votre demande a bien été prise en compte et vous recevrez un mail dès la restauration du service.", "Yes")
		EndSwitch
WEnd


; vitesse d'écriture
Opt("SendKeyDelay", 0) ;0 milliseconds
Opt("SendKeyDownDelay", 0) ;0 millisecond


Func envoiMacro($newSum, $newDesc, $newDiag, $newCategory, $newSubCategory, $newSymptoms, $newResolutionCode, $newResolutionMethod, $newResolution, $newFirstCall)

	WinActivate($hWnd)
   ControlSend($hWnd, "", $summary, $newSum)
   ControlClick($hWnd, "", $summary)
   ControlSend($hWnd, "", $desc, $newDesc)
   ControlClick($hWnd, "", $desc)
   ControlSend($hWnd, "", $diag, $newDiag)
   ControlClick($hWnd, "", $diag)
   ControlSend ($hWnd, "", $category, "{DOWN}")
   ControlClick($hWnd, "", $category)
   ControlSend ($hWnd, "", $category, "{DOWN}")
   Send($newCategory)
   Send("{TAB}")
   ; ControlClick($hWnd, "", $subCategory)
   Send($newSubCategory)
   Send("{TAB}")
   ; ControlClick($hWnd, "", $symptoms)
   Send($newSymptoms)
   Sleep(100)
   Send("{TAB}")
   ControlSend($hWnd, "", $resolutionCode, "{DOWN}")
   ControlClick($hWnd, "", $resolutionCode)
   ControlSend($hWnd, "", $resolutionCode, "{DOWN}")
   Send($newResolutionCode)
   Send("{TAB}")
   ControlSend($hWnd, "", $resolutionMethod, "{DOWN}")
   ControlClick($hWnd, "", $resolutionMethod)

   Send($newResolutionMethod)
   Send("{TAB}")
   ControlSend($hWnd, "", $resolution, $newResolution)
   ControlClick($hWnd, "", $resolution)
   ControlSend($hWnd, "", $firstCall, "{DOWN}")
   ControlClick($hWnd, "", $firstCall)
   ControlSend($hWnd, "", $firstCall, "{DOWN}")
   ControlClick($hWnd, "", $firstCall)
   Send($newFirstCall)
   Sleep(300)
   Send("{TAB}")

EndFunc

Func envoiDetail($newDetail)
   ControlSend($hWnd, "", $details, "{DOWN}")
   ControlClick($hWnd, "", $details)
   ControlSend($hWnd, "", $details, "{DOWN}")
   ControlClick($hWnd, "", $details)
   Send($newDetail)
EndFunc


Func envoiRequester($newRequester)

	WinActivate($hWnd)
	ControlClick($hWnd, "", $requester)
	Send("Nouveau collaborateur")
	Send("{TAB}")
	ControlClick($hWnd, "", "[NAME:btnOK]")
	Sleep(100)
	ControlClick($hWnd, "", "[NAME:btnOK]")
	Sleep(100)
	ControlClick($hWnd, "", "[NAME:btnOK]")
	ControlSend($hWnd, "", $details, "{DOWN}")
	ControlClick($hWnd, "", $details)
	ControlSend($hWnd, "", $details, "{DOWN}")
	send("APPEL RACCROCHE")
	Send("{TAB}")
	Sleep(100)

EndFunc