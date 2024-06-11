# Default parameter bør fungere. 
# Men det kan være at du må bruke -discard parameter dersom dingsen du forsøker å koble opp til ikke 
# sender svar tilbake.

param (
	$ipaddr='192.168.1.110', 
	$port=23, 
	$waittime=500, 
	[byte[]]$message = @([byte]13,10),
	[switch]$discard)

try {
	$c = New-Object System.Net.Sockets.TcpClient($ipaddr, $port)
	$str = $c.GetStream()
	#$msg = [System.BitConverter]::GetBytes($message)
	$msg = $message
	foreach ($byt in $msg) {
		Write-Host "Writing byte [$byt]"

		if ($byt -eq 0) {continue; }
		$str.Write($byt, 0, 1 )
		$buf = New-Object System.Byte[] 4096
		if ($discard -eq $false){
			$count = $str.Read($buf, 0, 4096)
			[System.Text.Encoding]::ASCII.GetString($buf, 0, $count)
		}
		Start-Sleep -Milliseconds $waittime
	}
	$str.Close()
	$c.Close()
	Write-Host "Done!"
}
catch {
	Write-Host "Det skjedde en feil"
	Write-Host $_
}