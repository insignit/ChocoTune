#########################################################################
#
# ChocoTune
#
# ChocoTune is a small compiled Powershell script that makes it possible
# integrage Chocolatey with MS Intune.
#
# Author: Martijn Verheijen
#
#########################################################################


# Define parameters
param(
[string]$Command = "",
[string]$ChocoPackages = "",
[string]$ChocoRepos = "https://chocolatey.org/api/v2/"
)

# Payload
########################################################################

# Setting some variables
[Array]$ChocoReposSplit=$ChocoRepos.split(",")
[Array]$ChocoPackagesSplit=$ChocoPackages.split(",")
$ChocoInstall = Join-Path ([System.Environment]::GetFolderPath("CommonApplicationData")) "Chocolatey\bin\choco.exe"
$reponameprefix = "Repo"
[int]$reponamesuffix = "0"

# Installing and Configuring Chocolatey
if(!(Test-Path $ChocoInstall)) {
    #Install Chocolatey  
    Invoke-Expression ((New-Object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) -ErrorAction Stop
    # removing chocolatey community repo
    Invoke-Expression 'cmd.exe /c $ChocoInstall source remove -n="chocolatey"' -ErrorAction Stop
    # Adding repo's
    foreach($Repo in $ChocoReposSplit) {
        $reponame= $reponameprefix + $reponamesuffix
        Invoke-Expression 'cmd.exe /c $ChocoInstall source add -n="$reponame" -s="$Repo" --priority="$reponamesuffix"' -ErrorAction Stop
        $reponamesuffix = $reponamesuffix + 1}
}

#(un)install Choco Packages
foreach($Package in $ChocoPackagesSplit) {
    try {
        Invoke-Expression "cmd.exe /c $ChocoInstall $Command $Package -y -force" -ErrorAction Stop
    }
    catch {
        Throw "Failed to install $Package"
    }
}