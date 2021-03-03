param ($InstallSource)
New-Item -Path "C:\" -Name "Install" -ItemType "directory"
Invoke-WebRequest -Uri $InstallSource -OutFile "C:\Install\abr_7_ws.msi"
Start-Process -Wait -FilePath "msiexec" -ArgumentList "/i C:\Install\abr_7_ws.msi /q" -PassThru
