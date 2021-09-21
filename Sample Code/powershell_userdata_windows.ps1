<powershell>
Write-Host("Welcome to Chandu training")

if(Test-Path -Path "C:\Chandu")
{
	write-host("Folder exists")
}
else
{
	New-Item -Path "c:\" -Name "Chandu" -ItemType "Directory"
}
$awscliurl = "https://s3.amazonaws.com/aws-cli/AWSCLI64PY3.msi"
$output = "c:\Chandu\AWSCLI64PY3.msi"
Invoke-WebRequest -Uri $awscliurl -OutFile $output
$pythonurl = "https://www.python.org/ftp/python/3.8.1/python-3.8.1-amd64.exe"
$output = "c:\Chandu\python-3.8.1-amd64.exe"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $pythonurl -OutFile $output
New-Item -Path C:\Chandu -Name "Chandu.txt" -ItemType "file" -Value "Welcome to AWS world."
[string]$installcmd = ""
$installcmd += "c:\Chandu\python-3.8.1-amd64.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0"
New-Item -Path C:\Chandu -Name "execute.bat" -ItemType "file" -Value $installcmd
Start-Process "cmd.exe"  "/c C:\Chandu\execute.bat"
Install-WindowsFeature -name Web-Server -IncludeManagementTools
Start-Sleep -s 60
New-Item -Path 'C:\inetpub\wwwroot\index.html' -ItemType File -Force
Add-Content C:\inetpub\wwwroot\index.html 'Welcome to 7am Batch'
Write-Host("Program ended")
</powershell>
