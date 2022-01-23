$env:STARSHIP_DISTRO = "";
$env:IP = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content;

function updateShell {
    Set-Location ~/.myzsh && pwsh update.ps1
}

Set-Alias -Name ushell -Value updateShell

function pullUpdateShell {
    Set-Location ~/.myzsh && git fetch origin && git reset --hard origin/master && git pull && pwsh update.ps1
}

Set-Alias -Name pshell -Value pullUpdateShell

Invoke-Expression (&starship init powershell)