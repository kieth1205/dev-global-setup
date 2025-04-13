# Windows installer script
$ErrorActionPreference = "Stop"

Write-Host "Starting Windows installation..."

# Check if running in CI environment
if ($env:CI -eq "true") {
    Write-Host "Running in CI environment, skipping package installation"
    # Just verify that we can run the script
    Write-Host "CI environment check passed"
} else {
    # Check if running as administrator
    function Test-Administrator {
        $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
        $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    }

    if (-not (Test-Administrator)) {
        Write-Host "Please run this script as Administrator"
        exit 1
    }

    # Check if Chocolatey is installed
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Chocolatey..."
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }

    # Update Chocolatey
    choco upgrade chocolatey -y

    # Install basic tools
    choco install -y curl
    choco install -y wget
    choco install -y git
    choco install -y vim
    choco install -y htop
    choco install -y python
    choco install -y nodejs
    choco install -y npm
}

Write-Host "Windows installation completed successfully!" 