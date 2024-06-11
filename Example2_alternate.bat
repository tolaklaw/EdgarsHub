rem Example 1 
rem [c0][Enter][i0][Enter][m1][Enter][n1][Enter][v0][Enter][e][Enter]

echo off
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "c0`r`ni0`r`nm1`r`nn1`r`nv0`r`ne`r`n"



