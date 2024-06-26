# Default parameter bør fungere. 

param (
	$ipaddr='192.168.1.110', 
	$port=23, 
	$waittime=500, 
	$message = "c0i4m3n3e"
)

$msg = [System.Text.Encoding]::ASCII.GetBytes($message)
try {
	$c = New-Object System.Net.Sockets.TcpClient($ipaddr, $port)
	$str = $c.GetStream()

	foreach ($byt in $msg) {
		Write-Host "Writing [$byt]"
		$str.Write($byt, 0, 1 )

		Start-Sleep -Milliseconds $waittime

		if ($str.DataAvailable)
		{
			$buf = New-Object System.Byte[] 4096						
			$count = $str.Read($buf, 0, 4096)
			for ($i=0; $i -le $count-1 ; $i++)
			{
				$value = $buf[$i]
				Write-Host "Received [$value]"
			}
		}
	}
	$str.Close()
	$c.Close()
	Write-Host "Done!"
}
catch {
	Write-Host "Det skjedde en feil"
	Write-Host $_
}