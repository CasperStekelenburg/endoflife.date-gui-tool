#Requires -Version 5.1
#Requires -Modules ps2exe

# Extract version from the PowerShell script
$ScriptContent = Get-Content "$pwd\Get-EndOfLife-GUI.ps1" -Raw
$VersionPattern = '\$Script:AppVersion\s*=\s*\[version\]"([^"]+)"'
if ($ScriptContent -match $VersionPattern) {
    $ScriptVersion = $Matches[1]
    # Evaluate the version string to get the actual version
    $ActualVersion = [version](Invoke-Expression "`"$ScriptVersion`"")
} else {
    # Fallback to date-based version if not found in script
    $ActualVersion = [version]"$((Get-Date).Year).$((Get-Date).Month).$((Get-Date).Day).$(Get-Date -Format 'HHmm')"
}

# Verify icon file exists
if (-not (Test-Path "$pwd\applogo.ico")) {
    Write-Error "Icon file applogo.ico not found in current directory"
    exit 1
}

$ParamSet = @{
    inputFile   = "$pwd\Get-EndOfLife-GUI.ps1"
    outputFile  = "$pwd\End-of-Life Product Checker.exe"
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

get-process $ParamSet.title -ErrorAction SilentlyContinue | Stop-Process -ErrorAction SilentlyContinue

Invoke-ps2exe @ParamSet

. "$pwd\End-of-Life Product Checker.exe"
