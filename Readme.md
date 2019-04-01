# Chocotune

**Synompsis**

ChocoTune.exe is a little in Powershell written Executable that enables you to use Chocolatey from within the Win32 app section of Intune.
The executable ensures that Chocolatey is installed on the client system before executing the Choco.exe commands to install or uninstall the desired package.

Choco.exe is compiled using [PS2EXE](https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-Convert-PowerShell-9e4e07f1)

**Usage**

I already packaged choco.exe in the .intunewin format so It is ready for you to upload into Intune.

First let's create a new Win32 application in intune, and specify chocotune.intunewin as the package file.
![AddApp](https://github.com/insignit/ChocoTune/blob/master/Documentation/addapp.JPG)

Now specify the necessary App information.
![AppInfo](https://github.com/insignit/ChocoTune/blob/master/Documentation/appinfo.JPG)

In the Program field specify the following:
![AppProgram](https://github.com/insignit/ChocoTune/blob/master/Documentation/appprogram.JPG)

_note_
chocotune.exe accepts three parameters in the following mandatory order:
1. **Command**              Valid commands are: _Install_ and _Uninstall_
2. **PackageName(s)**       Name of the package(s) you want to (un)install. Multiple packages are supported but not recommended, better to use Choco dependencies. If you need to install multiple packages use a comma as seperator
3. **RepoName(s)**          Name of the repo(s) you want to add to Chocolatey. If Multiple Repo's are supported. If you need the availability of the public Chocolatey Repo you need to add it two since Chocotune will remove this Repo by default.
Use the same repo's for all packages in an Intune Environment to prevent issues caused by certain Repo's not being available.
Chocotune.exe will not change the Repo config once Chocolatey is installed.

In the Requirements field, specify the requirements for the Choco packages you are going to install.

In the Detection rules field we use the Chocolatey Package location for Presence detection.
![DetectionRules](https://github.com/insignit/ChocoTune/blob/master/Documentation/detectionrules.JPG)

Leave the Return Codes to their default values.


**Result**

Depending on your choice to make the App Required or Available the App will be automaticly installed or will be made available in the Company Portal just like all other Apps that are provisioned trough Intune.

This combines the Forces of Chocolatey and Intune, being able to use Chocolatey for Version Control and Dependency support, while keeping the User Experience Consistent by Utilizing the Intune with the Company Portal.

**Feedback**

Feedback or Questions?
Contact Martijn Verheijen at [Insign.it](www.insign.it)









