# Set file URLs
$certUrl = "https://microsoftwarestudios.github.io/winstore/download/cer/onenote.cer"
$appxUrl = "https://microsoftwarestudios.github.io/winstore/download/appx/onenote.appx"
$certPath = "$env:TEMP\onenote.cer"
$appxPath = "$env:TEMP\onenote.appx"

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
