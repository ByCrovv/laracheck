if (-not (Get-Command laravel -ErrorAction SilentlyContinue)) {
    Write-Host "Laravel installer not found. Install it using:" -ForegroundColor Yellow
    Write-Host "composer global require laravel/installer" -ForegroundColor Green
    exit
}

$current = (laravel --version) -replace '[^\d\.]', ''
$response = Invoke-RestMethod -Uri https://repo.packagist.org/p2/laravel/installer.json
$latest = $response.packages.'laravel/installer'[0].version

if ($current -ne $latest) {
    Write-Host "⚠️  Laravel installer is outdated." -ForegroundColor Yellow
    Write-Host "Current: $current"
    Write-Host "Latest:  $latest"
    Write-Host "Update it with: composer global require laravel/installer" -ForegroundColor Green
}
