# Build script for Android WebView app
# Usage: run this in project root (where build.gradle and settings.gradle are)
# PowerShell: .\build.ps1

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
Set-Location $projectRoot

# Prefer bundled gradlew if present
$gradlew = Join-Path $projectRoot 'gradlew.bat'

if (Test-Path $gradlew) {
    Write-Host "Using wrapper: .\gradlew.bat assembleDebug"
    & .\gradlew.bat assembleDebug
} else {
    Write-Host "No gradlew found. Trying system 'gradle' (must be in PATH)."
    try {
        & gradle assembleDebug
    } catch {
        Write-Error "Gradle wrapper not found and 'gradle' is not available.\nPlease open the project in Android Studio and generate the Gradle wrapper, or install Gradle and add it to PATH."
        exit 1
    }
}

# After build, print location of APK
$apk = Join-Path $projectRoot 'app\build\outputs\apk\debug\app-debug.apk'
if (Test-Path $apk) {
    Write-Host "Build successful. APK: $apk"
} else {
    Write-Error "Build finished but APK not found at expected path: $apk"
    exit 1
}
