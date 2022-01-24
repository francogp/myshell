$env:STARSHIP_DISTRO = "";
$env:IP = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content;

function updateShell {
    Set-Location ~/.myshell && pwsh update.ps1
}

Set-Alias -Name ushell -Value updateShell

function pullUpdateShell {
    Set-Location ~/.myshell && git reset --hard && git pull && pwsh update.ps1
}

Set-Alias -Name pshell -Value pullUpdateShell

function Invoke-Starship-PreCommand {
    $host.ui.Write("`e]0; PS> $env:USERNAME@$env:COMPUTERNAME`: $pwd `a")
}

Invoke-Expression (&starship init powershell)