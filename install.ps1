$scriptUrl = "https://raw.githubusercontent.com/YOUR_USERNAME/laravel-update-checker/main/check.ps1"
$targetPath = "$HOME\laravel-check-update.ps1"

Invoke-WebRequest -Uri $scriptUrl -OutFile $targetPath

$profilePath = $PROFILE
if (!(Test-Path -Path $profilePath)) {
    New-Item -ItemType File -Path $profilePath -Force
}

$importLine = ". `"$targetPath`""
if (-not (Select-String -Path $profilePath -Pattern [regex]::Escape($importLine) -Quiet)) {
    Add-Content -Path $profilePath -Value "`n$importLine"
}

Write-Host "✅ Laravel update checker installed. Restart your PowerShell terminal."
