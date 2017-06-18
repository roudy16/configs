$nvimConfigDir = "$HOME\AppData\Local\nvim\"
$poshProfileDir = "$HOME\Documents\WindowsPowerShell\"
$gitConfigDir ="$HOME\"

$nvimConfigName = "init.vim"
$poshProfileName = "Microsoft.PowerShell_profile.ps1"
$gitConfigName = ".gitconfig"

function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}

$scriptDir = Get-ScriptDirectory
$scriptDir += "\"
$nvimConfigDst = $scriptDir + $nvimConfigName
$poshProfileDst = $scriptDir + $poshProfileName
$gitConfigDst = $scriptDir + $gitConfigName

$nvimConfigSrc = $nvimConfigDir + $nvimConfigName
$poshProfileSrc = $poshProfileDir + $poshProfileName
$gitConfigSrc = $gitConfigDir + $gitConfigName

if ((Test-Path $nvimConfigSrc) -eq $false) {
    Write-Output "NVim config not found"
} else {
    Copy-Item $nvimConfigSrc -Destination $nvimConfigDst -Force
}

if ((Test-Path $poshProfileSrc) -eq $false) {
    Write-Output "Powershell profile not found"
} else {
    Copy-Item $poshProfileSrc -Destination $poshProfileDst -Force
}

if ((Test-Path $gitConfigSrc) -eq $false) {
    Write-Output "Git config not found"
} else {
    Copy-Item $gitConfigSrc -Destination $gitConfigDst -Force
}