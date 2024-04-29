# reverse_shell_duckyscript

Penetration Testing Script: Rubber Ducky Reverse Shell Demonstration

DISCLAIMER: This script is intended for use on systems you own or have permission to use. I take no responsibility for any misuse.

Overview:
This script demonstrates how quickly a reverse shell can be created using the Rubber Ducky.
It utilizes netcat for communication. Ensure netcat is installed and ready on one of your machines.

Instructions:

Step 1: Customize the reverse shell script (rs.ps1):
Replace "{IP HERE}" and "{PORT HERE}" with your chosen IP address and port.
You'll need to port forward this to the machine you're listening to.

Step 2: Host the file or use a file hosting service:
Host rs.ps1 file somewhere or upload it to a file hosting website (e.g., anonfiles).
Ensure you get the direct download link, not the page link.

Step 3: Modify ducky.txt:
Insert the download link in the "LINK HERE" section of ducky.txt.

Step 4: Encode the payload:
Use a Rubber Ducky encoder to encode ducky.txt into a payload.

Step 5: Listen for incoming connections:
On your machine with netcat, run the following command:
nc -lnvp {PORT YOU ARE FORWARDING TO THIS MACHINE}

Step 6: Execute the payload:
Plug in the Rubber Ducky to the target machine.
If all goes well, the Rubber Ducky will start a hidden PowerShell session, granting you full remote control.

Notes:
This may not work if the target system has antivirus software other than Windows Defender.
Some networks may block the connection, but it should work on normal home networks, etc.

