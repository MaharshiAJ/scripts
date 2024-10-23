param (
    [string]$envName = ".venv"
)

# Function to start (activate) the virtual environment
function Start-Venv {
    param (
        [string]$envPath
    )
    $activateScript = ".\$envPath\Scripts\Activate.ps1"
    if (Test-Path $activateScript) {
        Write-Output "Activating the virtual environment..."
        & $activateScript
    }
    else {
        Write-Error "Failed to find the activation script."
        exit 1
    }
}

# Check if Python is installed
$python = Get-Command python -ErrorAction SilentlyContinue
if (-not $python) {
    Write-Error "Python is not installed or not in the system path."
    exit 1
}

# Check if the virtual environment already exists
if (Test-Path "$envName") {
    Write-Output "Virtual environment '$envName' already exists. Activating..."
    Start-Venv -envPath $envName
}
else {
    # Create the virtual environment
    Write-Output "Creating virtual environment '$envName'..."
    python -m venv $envName

    # Check if the virtual environment was created successfully
    if (-not (Test-Path "$envName")) {
        Write-Error "Failed to create the virtual environment."
        exit 1
    }

    # Activate the virtual environment
    Start-Venv -envPath $envName
}