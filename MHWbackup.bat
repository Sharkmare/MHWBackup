@ECHO off
TITLE MHW Backup Script
SET STEAMID=STEAMIDGOESHERE
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
