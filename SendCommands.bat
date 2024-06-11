echo off
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "c0"
timeout 1
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "i4"
timeout 1
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "m3"
timeout 1
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "n3"
timeout 1
Powershell.exe -executionpolicy remotesigned -File  Send-TelnetCommand.ps1 -waittime 100 -message "e"
timeout 1
echo "Ferdig"
