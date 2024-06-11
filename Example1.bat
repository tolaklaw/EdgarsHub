rem Example 1 
rem [c0][Enter][i0][Enter][m1][Enter][n1][Enter][v0][Enter][e][Enter]

echo off
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "c0`r`n"
timeout 1
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "i0`r`n"
timeout 1
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "m1`r`n"
timeout 1
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "n1`r`n"
timeout 1
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "v0`r`n"
timeout 1
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "e`r`n"
timeout 1
echo "Ferdig"



