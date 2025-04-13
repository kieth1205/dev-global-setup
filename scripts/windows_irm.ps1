# Windows deployment script using Invoke-WebRequest
$ErrorActionPreference = "Stop"

# Create temporary directory
$tempDir = Join-Path $env:TEMP "dev-setup"
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

# Function to cleanup on exit
function Cleanup {
    Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
}

# Set up trap for cleanup
Register-EngineEvent -SourceIdentifier PowerShell.Exiting -Action { Cleanup }

# Check if running in CI environment
if ($env:CI -eq "true") {
    Write-Host "Running in CI environment, skipping admin check"
    # Download and execute the main setup script
    $setupScript = Join-Path $tempDir "setup.ps1"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/src/installers/windows_installer.ps1" -OutFile $setupScript
    & $setupScript
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

    # Download and execute the main setup script
    $setupScript = Join-Path $tempDir "setup.ps1"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/src/installers/windows_installer.ps1" -OutFile $setupScript
    & $setupScript
} 