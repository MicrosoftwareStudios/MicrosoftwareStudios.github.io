

# Set file URLs
$certUrl = "https://dl.retiled.xyz/Apptravaganza%21/ESPN%20%288.1%29/ESPN%20%288.1.cer"
$appxUrl = "https://dl.retiled.xyz/Apptravaganza%21/ESPN%20%288.1%29/ESPN%20%288.1.appx"
$certPath = "$env:TEMP\espn.cer"
$appxPath = "$env:TEMP\espn.appx"

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
