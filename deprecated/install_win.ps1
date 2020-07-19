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
$nvimConfigSrc = $scriptDir + $nvimConfigName
$poshProfileSrc = $scriptDir + $poshProfileName
$gitConfigSrc = $scriptDir + $gitConfigName

$nvimConfigDst = $nvimConfigDir + $nvimConfigName
$poshProfileDst = $poshProfileDir + $poshProfileName
$gitConfigDst = $gitConfigDir + $gitConfigName

if ((Test-Path $nvimConfigDir) -eq $false) {
    New-Item $nvimConfigDir -ItemType directory
}

if ((Test-Path $poshProfileDir) -eq $false) {
    New-Item $poshProfileDir -ItemType directory
}

Copy-Item $nvimConfigSrc -Destination $nvimConfigDst -Force
Copy-Item $poshProfileSrc -Destination $poshProfileDst -Force
Copy-Item $gitConfigSrc -Destination $gitConfigDst -Force