@ECHO off
TITLE MHW Backup Script
SET SIF=C:\Program Files (x86)\Steam\userdata
::Checking if we have a saved Steam Insatall Filepath (SIF)
IF NOT EXIST SIF GOTO NATIVESIF
set /p SIF=<SIF
:NATIVESIF
ECHO %SIF%
:START
IF NOT EXIST "%SIF%" GOTO WhereYouInstallBruh
IF NOT EXIST SID GOTO genSID
set /p STEAMID=<SID
IF NOT EXIST "%SIF%\%STEAMID%\582010\remote" GOTO Error001
Time/t>tmptime.txt
Date/t>tmpdate.txt
timeout/t 2>nul
set /p datevar=<tmpdate.txt
set /p timevar=<tmptime.txt
set timevar=%timevar::=_%
set datevar=%datevar: =-%
set datevar=%datevar:/=_%
set storeDir="C:\Users\%USERNAME%\MHBACKUP\%datevar%%timevar%\"
xcopy /f /s /y "%SIF%\%STEAMID%\582010\remote" %storeDir%
TIMEOUT/t 5>nul

cls
ECHO[
ECHO END reached succesfully 10 seconds until auto termination
ECHO LOG: Succesfully backed up file on %DATE% at %TIME% saved in %storeDir%>lastlog.log
ECHO LOG: Succesfully backed up file on %DATE% at %TIME% saved in %storeDir%>>Persistentlog.log
TIMEOUT/t 10>nul
exit/b
:Error001

CLS
ECHO "ERROR: 1" MHW Savefile not found
ECHO Possibly wrong STEAMID 
ECHO[
ECHO Please Delete "%CD%\SID" or manually modify your SID file to contain the correct ID
PAUSE
GOTO START
:genSID

copy /y NUL SID >NUL
cls
ECHO First time setup triggered
ECHO[
ECHO Please enter your SteamID
SET/P SID="SteamID="
set STEAMID=%SID%
IF NOT EXIST "%SIF%\%STEAMID%\582010\remote" GOTO Error001
ECHO %SID%>SID
GOTO START
:WhereYouInstallBruh

cls
ECHO %SIF%
ECHO Steam Installation not found
ECHO[
ECHO Please enter the path to your STEAM Folder
ECHO Example "C:\Program Files (x86)" NO \ at the end
SET/P SIF="Steam Install Folder="
IF NOT EXIST "%SIF%\Steam\userdata" GOTO SIFwrong
set SIF=%SIF%\Steam\userdata
ECHO %SIF%>SIF
GOTO START
:SIFwrong

cls
ECHO "%SIF%\Steam\userdata" not found.
TIMEOUT/t 10>nul
GOTO WhereYouInstallBruh
