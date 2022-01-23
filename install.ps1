if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Write-Output "Installing chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Output "Restart terminal, and execute this script again"
choco upgrade chocolatey
# choco install starchip

if (!(Test-Path $PROFILE)) {
    Write-Host "Creating config file to support starship on powershell...";
    New-Item -path (Split-Path -Path $PROFILE) -name (Split-Path -Path $PROFILE -Leaf) -type "file" -value "Invoke-Expression (&starship init powershell)" -Force;
}
else {
    $SEL = Select-String -Path $PROFILE -Pattern "starship init powershell";
    if ($null -ne $SEL) {
        Write-Host "already configurated.. ignoring code";
    }
    else {
        Write-Host "Updating config file to support starship on powershell...";
        Add-Content -path $PROFILE -value "`r`nInvoke-Expression (&starship init powershell)" -Force;
    }
}

New-Item -Path (Split-Path -Path $PROFILE) -type "directory" -Force;
Copy-Item -Path "$PSScriptRoot\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE -Force

New-Item -Path "$HOME/.config/" -type "directory" -Force;
Copy-Item -Path "$PSScriptRoot\starship.toml" -Destination "$HOME/.config/" -Force

Write-Host 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');