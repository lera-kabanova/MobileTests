$envFile = ".env"

if (-not (Test-Path $envFile)) {
    Write-Error "Файл .env не найден"
    exit 1
}

$envLines = Get-Content $envFile

foreach ($line in $envLines) {
    if ([string]::IsNullOrWhiteSpace($line) -or $line.StartsWith("#")) {
        continue
    }

    $parts = $line -split "=", 2

    if ($parts.Count -ne 2) {
        continue
    }

    $name = $parts[0].Trim()
    $value = $parts[1].Trim()

    [Environment]::SetEnvironmentVariable($name, $value, "Process")
}

Write-Host "Running Maestro test..."

maestro test `
    -e "EMAIL=$env:EMAIL" `
    -e "PASSWORD=$env:PASSWORD" `
    flows/charging/01_full_tank_balance.yaml