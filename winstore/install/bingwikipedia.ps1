


# Set file URLs
$certUrl = "https://dl.retiled.xyz/Apptravaganza%21/Bing%20Wikipedia%20Browser/x86/Microsoft.BingWikipediaBrowser_1.0.0.108_x86__8wekyb3d8bbwe.cer"
$appxUrl = "https://dl.retiled.xyz/Apptravaganza%21/Bing%20Wikipedia%20Browser/x86/Microsoft.BingWikipediaBrowser_1.0.0.108_x86__8wekyb3d8bbwe.appx"
$certPath = "$env:TEMP\bingwikipedia.cer"
$appxPath = "$env:TEMP\bingwikipedia.appx"

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
