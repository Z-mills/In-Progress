# Check if firewall is enabled
$fw = Get-NetFirewallProfile -All | Where-Object { $_.Enabled -eq "True" }
if ($fw) {
    Write-Host "Firewall is enabled"
} else {
    Write-Host "Firewall is not enabled"
}

# Check if antivirus is installed
$av = Get-WmiObject -Class "Win32_Product" | Where-Object { $_.Name -like "*antivirus*" }
if ($av) {
    Write-Host "Antivirus is installed"
} else {
    Write-Host "Antivirus is not installed"
}

# Check if Windows Defender is enabled
$defender = Get-MpPreference | Where-Object { $_.RealTimeMonitoringEnabled -eq "True" }
if ($defender) {
    Write-Host "Windows Defender is enabled"
} else {
    Write-Host "Windows Defender is not enabled"
}

# Check if User Account Control is enabled
$uac = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" | Where-Object { $_.EnableLUA -eq "1" }
if ($uac) {
    Write-Host "User Account Control is enabled"
} else {
    Write-Host "User Account Control is not enabled"
}
