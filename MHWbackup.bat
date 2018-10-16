@ECHO off
:START
TITLE MHW Backup Script
IF NOT EXIST SID GOTO genSID
set /p STEAMID=<SID
IF NOT EXIST "C:\Program Files (x86)\Steam\userdata\%STEAMID%\582010\remote" GOTO Error001
set /p STEAMID=<SID
Time/t>tmptime.txt
Date/t>tmpdate.txt
timeout/t 2>nul
set /p datevar=<tmpdate.txt
set /p timevar=<tmptime.txt
set timevar=%timevar::=_%
set datevar=%datevar: =-%
set datevar=%datevar:/=_%
set storeDir="C:\Users\%USERNAME%\MHBACKUP\%datevar%%timevar%\"
xcopy /f /s /y "C:\Program Files (x86)\Steam\userdata\%STEAMID%\582010\remote" "C:\Users\%USERNAME%\MHBACKUP\%datevar%%timevar%\"
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
IF NOT EXIST "C:\Program Files (x86)\Steam\userdata\%STEAMID%\582010\remote" GOTO Error001
ECHO %SID%>SID
GOTO START
