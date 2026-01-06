# Build + install script
# Usage: run from project root: .\install.ps1

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
Set-Location $projectRoot

# Try to build first (will use gradlew if available)
Write-Host "Building app (assembleDebug)..."
& .\build.ps1

# APK path
$apk = Join-Path $projectRoot 'app\build\outputs\apk\debug\app-debug.apk'
if (-not (Test-Path $apk)) {
    Write-Error "APK not found at $apk"
    exit 1
}

# Check adb
try {
    $adbVersion = & adb version 2>&1
} catch {
    Write-Error "'adb' not found. Please install Android Platform Tools and ensure 'adb' is in PATH."
    exit 1
}

Write-Host "Installing APK to connected device(s)..."
& adb devices
& adb install -r "$apk"
Write-Host "Done. If installation failed, check device log or run 'adb logcat' for details."