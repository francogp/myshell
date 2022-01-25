$env:STARSHIP_DISTRO = "";

function updateShell {
    Set-Location ~/.myshell && pwsh update.ps1
}

Set-Alias -Name ushell -Value updateShell

function pullUpdateShell {
    Set-Location ~/.myshell && git reset --hard && git pull && pwsh update.ps1
}

Set-Alias -Name pshell -Value pullUpdateShell

function getPublicIP {
    Write-Output "$((Invoke-WebRequest -uri "http://ifconfig.me/ip").Content)";
}

Set-Alias -Name publicip -Value pullUpdateShell

function Invoke-Starship-PreCommand {
    $FREE_SPACE = Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object -Property Name -EQ "$((get-location).Drive.Name):" | ForEach-Object { 100 - [math]::Round(($_.FreeSpace * 100) / $_.Size, 0) }
    if ( $FREE_SPACE -gt 95) {
        $env:FREE_SPACE_RED = "$FREE_SPACE%"
    }
    elseif ( $FREE_SPACE -gt 90) {
        $env:FREE_SPACE_YELLOW = "$FREE_SPACE%"
    }
    else {
        $env:FREE_SPACE_GREEN = "$FREE_SPACE%"
    }
    $host.ui.Write("`e]0;$env:USERNAME@$env:COMPUTERNAME`: $pwd `a")
}

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

If (Test-Path -Path "${HOME}\.myshell\mods\Microsoft.PowerShell_profile.ps1" ) {
    . "${HOME}\.myshell\mods\Microsoft.PowerShell_profile.ps1"
}

Invoke-Expression (&starship init powershell)