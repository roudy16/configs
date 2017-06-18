$nvimConfigDir = "$HOME\AppData\Local\nvim\"
$poshProfileDir = "$HOME\Documents\WindowsPowerShell\"

$nvimConfigName = "init.vim"
$poshProfileName = "Microsoft.PowerShell_profile.ps1"

function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}

$scriptDir = Get-ScriptDirectory
$scriptDir += "\"
$nvimConfigSrc = $scriptDir + $nvimConfigName
$poshProfileSrc = $scriptDir + $poshProfileName

$nvimConfigDst = $nvimConfigDir + $nvimConfigName
$poshProfileDst = $poshProfileDir + $poshProfileName

if ((Test-Path $nvimConfigDir) -eq $false) {
    New-Item $nvimConfigDir -ItemType directory
}

if ((Test-Path $poshProfileDir) -eq $false) {
    New-Item $poshProfileDir -ItemType directory
}

Copy-Item $nvimConfigSrc -Destination $nvimConfigDst
Copy-Item $poshProfileSrc -Destination $poshProfileDst
