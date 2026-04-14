
# Set file URLs
$certUrl = "https://dl.retiled.xyz/Apptravaganza%21/TED%20Talks/25132CalvinApps.TEDTalks_1.0.0.2_neutral__249jsrde0k9zj.cer"
$appxUrl = "https://dl.retiled.xyz/Apptravaganza%21/TED%20Talks/25132CalvinApps.TEDTalks_1.0.0.2_neutral__249jsrde0k9zj.appx"
$certPath = "$env:TEMP\tedtalks.cer"
$appxPath = "$env:TEMP\tedtalks.appx"

# Download Certificate
Write-Host "Downloading certificate..."
Invoke-WebRequest -Uri $certUrl -OutFile $certPath

# Install Certificate
Write-Host "Installing certificate..."
Import-Certificate -FilePath $certPath -CertStoreLocation Cert:\LocalMachine\TrustedPeople

# Download APPX package
Write-Host "Downloading APPX package..."
Invoke-WebRequest -Uri $appxUrl -OutFile $appxPath

# Install APPX
Write-Host "Installing APPX package..."
Add-AppxPackage -Path $appxPath

Write-Host "Installation complete!"
