$certFileName = "ssl_cert"
$certPassword = "cert-password"
$certStore = "cert:\CurrentUser\My"
$site = "localhost"

# setup certificate properties including the commonName (DNSName) property
$certificate = New-SelfSignedCertificate `
    -Subject $site `
    -DnsName $site `
    -KeyAlgorithm RSA `
    -KeyLength 2048 `
    -NotBefore (Get-Date) `
    -NotAfter (Get-Date).AddYears(2) `
    -CertStoreLocation $certStore `
    -FriendlyName "Localhost Certificate for .NET Core" `
    -HashAlgorithm SHA256

$certificatePath = $certStore + "\" + ($certificate.ThumbPrint)  

# create temporary certificate path
$exportDir = $PSScriptRoot + "\..\Vonk.IdentityServer.Test"

# set certificate password here
$pfxPassword = ConvertTo-SecureString -String $certPassword -Force -AsPlainText
$pfxFilePath = "$exportDir\$certFileName.pfx"
$cerFilePath = "$exportDir\$certFileName.cer"

Write-Host "cerFilePath = $cerFilePath"

# create pfx certificate
Export-PfxCertificate -Cert $certificatePath -FilePath $pfxFilePath -Password $pfxPassword
Export-Certificate -Cert $certificatePath -FilePath $cerFilePath

# import the pfx certificate
Import-PfxCertificate -FilePath $pfxFilePath Cert:\LocalMachine\My -Password $pfxPassword -Exportable

# trust the certificate by importing the pfx certificate into your trusted root
Import-Certificate -FilePath $cerFilePath -CertStoreLocation Cert:\CurrentUser\Root

# optionally delete the physical certificates (don’t delete the pfx file as you need to copy this to your app directory)
# Remove-Item $pfxFilePath
Remove-Item $cerFilePath
