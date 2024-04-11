Set-ExecutionPolicy Unrestricted
$ErrorActionPreference = "Stop"

# Set current directory to script directory
Set-Location -Path $PSScriptRoot

# Output path where the build and all generated files is stored
$BuildPath = "$PSScriptRoot\Build"

# Target framework and runtime identifier
# win10-x64 is required - don't use win-x64 because of: https://github.com/PowerShell/PowerShell/issues/7909
$TargetFramework = "net8.0-windows10.0.19041.0"
#$TargetFramework = "net7.0-windows10.0.19041.0"
#$TargetFramework = "net6.0-windows10.0.17763.0"
$RuntimeIdentifier = "win10-x64"
$CertThumb = "97F93D02F2C3EA0109C2572809DBD955C201DDCA"
cls
# publish as exe files (https://learn.microsoft.com/en-us/dotnet/maui/windows/deployment/publish-unpackaged-cli?view=net-maui-8.0)
#dotnet publish ".\src\MauiAppBasement\MauiAppBasement.csproj" -f $TargetFramework -c Release -p:WindowsPackageType=None -p:WindowsAppSDKSelfContained=true -p:RuntimeIdentifierOverride=$RuntimeIdentifier
# publish as package (https://learn.microsoft.com/en-us/dotnet/maui/windows/deployment/publish-cli?view=net-maui-8.0)
dotnet publish ".\src\MauiApp\MauiApp\MauiApp.csproj" -f $TargetFramework -c Release -p:WindowsAppSDKSelfContained=true -p:RuntimeIdentifierOverride=$RuntimeIdentifier
# -p:PackageCertificateThumbprint=$CertThumb
