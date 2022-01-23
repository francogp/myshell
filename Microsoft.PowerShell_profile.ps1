$env:STARSHIP_DISTRO = "";
$env:IP = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content;

Invoke-Expression (&starship init powershell)