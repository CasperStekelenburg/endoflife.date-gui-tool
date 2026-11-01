#Requires -Version 5.1
#Requires -Modules ps2exe

$ScriptContent = Get-Content "$pwd\Get-EndOfLife-GUI.ps1" -Raw
$VersionPattern = '\$Script:AppVersion\s*=\s*\[version\]"([^"]+)"'
if ($ScriptContent -match $VersionPattern) {
	$ScriptVersion = $Matches[1]
	$ActualVersion = [version](Invoke-Expression "`"$ScriptVersion`"")
} else {
	$ActualVersion = [version]"$((Get-Date).Year).$((Get-Date).Month).$((Get-Date).Day).$(Get-Date -Format 'HHmm')"
}

if (-not (Test-Path "$pwd\applogo.ico")) {
	Write-Error "Icon file applogo.ico not found in current directory"
	exit 1
}

$OutputDirectory = Join-Path $pwd "dist"
New-Item -Path $OutputDirectory -ItemType Directory -Force | Out-Null

$ParamSet = @{
	inputFile   = "$pwd\Get-EndOfLife-GUI.ps1"
	outputFile  = Join-Path $OutputDirectory "End-of-Life Product Checker.exe"
	noConsole   = $true
	iconFile    = "$pwd\applogo.ico"
	title       = "End-of-Life Product Checker"
	description = "Check the End-of-Life status of software products and services."
	company     = "Casper Stekelenburg"
	copyright   = "Casper Stekelenburg - casper@dutchscriptingguys.com"
	version     = $ActualVersion
	product     = "End-of-Life Product Checker"
	verbose     = $true
}

Get-Process $ParamSet.title -ErrorAction SilentlyContinue | Stop-Process -ErrorAction SilentlyContinue

Invoke-PS2EXE @ParamSet
