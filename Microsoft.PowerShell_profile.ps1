$env:STARSHIP_DISTRO = "";
$env:IP = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content;

Set-Alias "ushell" "cd ~/.myzsh && git fetch origin && git reset --hard origin/master && pwsh update.ps1"

Invoke-Expression (&starship init powershell)