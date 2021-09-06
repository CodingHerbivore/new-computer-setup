# Self-elevate to admin thanks to GitHub user atao
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Run through the manual installers
function Launch-Installers {

	# Bing wallpaper app (Gotta have pretty pictures)
	# EXE SAMPLE
	Start-Process -Wait -Filepath ''

	# MSI SAMPLE
	Start-Process msiexec.exe -ArgumentList '/i "filepath"' -Wait

}
#Launch-Installers

# Install stuff with Chocolatey
function Start-Chocolatey {
	# Install Chocolatey
	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

	# 7-zip
	Write-Host "Install 7-zip"
	choco install 7zip.install -y

	# Firefox
	Write-Host "Install Firefox"
	choco install firefox -y

	# Foxit Reader
	Write-Host "Install Foxit"
	choco install foxitreader -y

	# Steam
	Write-Host "Install Steam instead of getting work done"
	choco install steam-client -y

	# VLC
	Write-Host "Install VLC"
	choco install vlc -y

	# Windows Terminal (remove once Microsoft fixes it in Windows 11)
	Write-Host "Install Windows Terminal"
	choco install microsoft-windows-terminal -y	

	# WinSCP (Fuck Filezilla)
	Write-Host "Install WinSCP"
	choco install winscp.install -y

}
#Start-Chocolatey

# Install WSL
function Install-WSL {
	wsl --install
}
#Install-WSL

Write-Host "Success"
Read-Host "Press Enter to exit."