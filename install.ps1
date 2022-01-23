if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { 
    Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit 
}

# 1) INSTALL powershell from microsoft store!
# 2) install nerdfonts!

Write-Output "Installing chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

Write-Output "Restart terminal, and execute this script again"
choco upgrade all -y
choco install starship --force -y

New-Item -Path (Split-Path -Path $PROFILE) -type "directory" -Force;
Copy-Item -Path "$PSScriptRoot\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE -Force

New-Item -Path "$HOME/.config/" -type "directory" -Force;
Copy-Item -Path "$PSScriptRoot\starship.toml" -Destination "$HOME/.config/" -Force

Write-Host 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');