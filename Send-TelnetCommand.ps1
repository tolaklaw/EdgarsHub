param ($ipaddr='192.168.1.110', $port=23, $waittime=500, $message = "c0i4m3n3e", [switch]$discard)

$msg = [System.Text.Encoding]::ASCII.GetBytes($message)
try {
	$c = New-Object System.Net.Sockets.TcpClient($ipaddr, $port)
	$str = $c.GetStream()

	foreach ($byt in $msg) {
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
}
catch {
	Write-Host "Det skjedde en feil"
	Write-Host $_
}