# Set the path for the DR folder
$DRFolder = "$env:USERPROFILE\Desktop\DR"

# Create the DR folder if it doesn't exist
if (!(Test-Path $DRFolder)) {
    New-Item -ItemType Directory -Path $DRFolder | Out-Null
}

# Copy the logs to the DR folder
Copy-Item -Path "C:\Windows\System32\winevt\Logs\Application.evtx" -Destination "$DRFolder\Application.evtx" -Force
Copy-Item -Path "C:\Windows\System32\winevt\Logs\Security.evtx" -Destination "$DRFolder\Security.evtx" -Force
Copy-Item -Path "C:\Windows\System32\winevt\Logs\System.evtx" -Destination "$DRFolder\System.evtx" -Force
Copy-Item -Path "C:\Windows\panther\setupact.log" -Destination "$DRFolder\setupact.log" -Force
Copy-Item -Path "C:\Windows\panther\setuperr.log" -Destination "$DRFolder\setuperr.log" -Force

# Notify the user that the logs have been copied
Write-Host "Logs copied to $DRFolder"
