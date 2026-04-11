
# Set file URLs
$certUrl = "https://microsoftwarestudios.github.io/winstore/download/cer/survivalcraft.cer"
$appxUrl = "https://microsoftwarestudios.github.io/winstore/download/appx/survivalcraft.appx"
$certPath = "$env:TEMP\survivalcraft.cer"
$appxPath = "$env:TEMP\survivalcraft.appx"

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
