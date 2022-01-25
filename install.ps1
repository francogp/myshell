if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { 
    Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit 
}

# 1) INSTALL powershell from microsoft store!
# 2) install nerdfonts!

Write-Output "Installing chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
Install-Module -Force -Name PSReadLine -RequiredVersion 2.1.0

choco upgrade all -y
choco install starship --force -y
choco install jetbrainsmononf --force -y

If (Test-Path -Path "$PSScriptRoot\mods\install.ps1" ) {
    pwsh.exe -NoProfile -ExecutionPolicy Bypass -File "$PSScriptRoot\mods\install.ps1"
}

pwsh.exe -NoProfile -ExecutionPolicy Bypass -File "$PSScriptRoot\update.ps1"

Write-Host '*** CLOSE AND OPEN POWERSHELL AGAIN! ***';

Write-Host 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');