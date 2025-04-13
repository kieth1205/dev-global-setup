# Windows deployment script using PowerShell
$ErrorActionPreference = "Stop"

# Function to check if running as administrator
function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Check if running as administrator
if (-not (Test-Administrator)) {
    Write-Host "Please run this script as Administrator" -ForegroundColor Red
    exit 1
}

# Create temporary directory
$tempDir = Join-Path $env:TEMP "dev-setup"
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

try {
    # Download and execute the main setup script
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/src/installers/windows_installer.ps1" -OutFile "$tempDir\setup.ps1"
    
    # Execute the setup script
    & "$tempDir\setup.ps1"
    
    # Cleanup
    Remove-Item -Path $tempDir -Recurse -Force
} catch {
    Write-Host "Error: $_" -ForegroundColor Red
    exit 1
} 