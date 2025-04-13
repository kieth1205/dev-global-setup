# Windows installer script
$ErrorActionPreference = "Stop"

Write-Host "Starting Windows installation..."

# Check if Chocolatey is installed
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Update Chocolatey
choco upgrade chocolatey -y

# Install basic tools
choco install -y `
    curl `
    wget `
    git `
    vim `
    htop `
    python `
    nodejs `
    npm

Write-Host "Windows installation completed successfully!" 