param ($VHDLocations, $InstallSource)
New-Item -Path "HKLM:\SOFTWARE" -Name "FSLogix"
New-Item -Path "HKLM:\SOFTWARE\FSLogix" -Name "Profiles"
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "Enabled" -Value "1" -PropertyType "Dword" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "VHDLocations" -Value $VHDLocations -PropertyType "MultiString" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "DeleteLocalProfileWhenVHDShouldApply" -Value "1" -PropertyType "Dword" -Force
New-Item -Path "C:\" -Name "Install" -ItemType "directory"
Invoke-WebRequest -Uri $InstallSource -OutFile "C:\Install\FSLogixAppsSetup.exe"
Start-Process -Wait -FilePath "C:\Install\FSLogixAppsSetup.exe" -ArgumentList "/install /quiet" -PassThru