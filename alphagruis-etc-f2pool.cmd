::
:: Windows batch/cmd file to automatically restart the miner in case
:: of a crash. Abnormal malfunctions should never occur, however it is
:: recommended that you run the miner via this script.
::

@echo off

setlocal

set JsonFile=alphagruis-etc-f2pool.json

:start

"%~dp0alphagruis-etc.exe" "%JsonFile%"

timeout /t 15 /nobreak

goto start

endlocal
