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
$nvimConfigDst = $scriptDir + $nvimConfigName
$poshProfileDst = $scriptDir + $poshProfileName

$nvimConfigSrc = $nvimConfigDir + $nvimConfigName
$poshProfileSrc = $poshProfileDir + $poshProfileName

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
