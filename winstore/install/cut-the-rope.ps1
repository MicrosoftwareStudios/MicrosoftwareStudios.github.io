

# Set file URLs
$certUrl = "https://dl.retiled.xyz/Apptravaganza%21/Cut%20The%20Rope/8.1/x86/ZeptoLabUKLimited.CutTheRope_1.2.0.43_x86__sq9zxnwrk84pj.cer"
$appxUrl = "https://dl.retiled.xyz/Apptravaganza%21/Cut%20The%20Rope/8.1/x86/ZeptoLabUKLimited.CutTheRope_1.2.0.43_x86__sq9zxnwrk84pj.appx"
$certPath = "$env:TEMP\cut-the-rope.cer"
$appxPath = "$env:TEMP\cut-the-rope.appx"

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
