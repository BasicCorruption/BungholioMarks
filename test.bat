@echo off

if %1==cpu (
    lime test windows -Dsoft -Dfullscreen -Dttf 
)
if %2==gpu (
    lime test windows -Dhard -Dfullscreen -Dttf 
)

pause>nul
exit
