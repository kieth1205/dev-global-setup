# Windows deployment script using Invoke-WebRequest
param(
    [switch]$Test
)

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

# Function to get repository info
function Get-RepoInfo {
    if ($env:GITHUB_REPOSITORY) {
        return $env:GITHUB_REPOSITORY
    } else {
        try {
            $remoteUrl = git config --get remote.origin.url
            return $remoteUrl -replace '.*github.com[:/]' -replace '\.git$'
        } catch {
            return "kieth1205/dev-global-setup"
        }
    }
}

# Function to get commit SHA
function Get-CommitSha {
    if ($env:GITHUB_SHA) {
        return $env:GITHUB_SHA
    } else {
        try {
            return git rev-parse HEAD
        } catch {
            return "main"
        }
    }
}

$repo = Get-RepoInfo
$commitSha = Get-CommitSha
$installerUrl = "https://raw.githubusercontent.com/$repo/$commitSha/src/installers/windows_installer.ps1"

# Check if running in CI environment
if ($env:CI -eq "true" -or $Test) {
    Write-Host "Running in CI environment or test mode, skipping admin check"
    Write-Host "Repository: $repo"
    Write-Host "Commit SHA: $commitSha"
    Write-Host "Installer URL: $installerUrl"
    
    # Download and execute the main setup script
    $setupScript = Join-Path $tempDir "setup.ps1"
    try {
        Invoke-WebRequest -Uri $installerUrl -OutFile $setupScript -ErrorAction Stop
        if ($Test) {
            Write-Host "Test mode: Script downloaded successfully"
            exit 0
        }
        & $setupScript
    } catch {
        Write-Host "Error: Failed to download installer script"
        Write-Host "Error details: $_"
        exit 1
    }
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
    try {
        Invoke-WebRequest -Uri $installerUrl -OutFile $setupScript -ErrorAction Stop
        & $setupScript
    } catch {
        Write-Host "Error: Failed to download installer script"
        Write-Host "Error details: $_"
        exit 1
    }
} 