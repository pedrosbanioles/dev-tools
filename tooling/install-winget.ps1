Write-Host "Downloading WinGet and its dependencies...(this can take a while)"
$progressPreference = 'silentlyContinue'
mkdir C:\tmp
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile c:\tmp\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile c:\tmp\Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile c:\tmp\Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage c:\tmp\Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage c:\tmp\Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage c:\tmp\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle