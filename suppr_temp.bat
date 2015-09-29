:: fichier .BAT
@echo off
color a
::suppression des fichiers temporaires
if EXIST "C:\Users\%username%\AppData\Local\Temp\*.*" (
	:: windows 7
	RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
	del /F /S /Q "C:\Users\%username%\AppData\Local\Temp\*.*"
	del /F /S /Q "C:\Users\%username%\AppData\Local\Temp\Low\*.*"
) ELSE (
	:: windows XP
	del /F /S /Q "c:\documents and settings\%username%\Local Settings\Temporary Internet Files\*.*" 
	del /F /S /Q "c:\documents and settings\%username%\Local Settings\Temporary Internet Files\Content.ie5\*.*" 
	del /F /S /Q "c:\documents and settings\%username%\Local Settings\Temp\*.*" 
	del /F /S /Q "c:\documents and Settings\%username%\Cookies\*.*" 
	del /F /S /Q "c:\documents and Settings\%username%\Recent\*.*" 
)
::actualisation des paramètres de stratégie
gpupdate /force
