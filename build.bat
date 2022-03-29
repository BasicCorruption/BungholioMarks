@echo off

lime build windows -Dhard -Dfullscreen
lime build windows -Dsoft -Dfullscreen

echo Press any key to exit...
pause>nul
