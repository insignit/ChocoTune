# Chocotune

**Synompsis**

ChocoTune.exe is a little in Powershell written Executable that enables you to use Chocolatey from within the Win32 app section of Intune.
The executable ensures that Chocolatey is installed on the client system before executing the Choco.exe commands to install or uninstall the desired package.

Choco.exe is compiled using [PS2EXE](https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-Convert-PowerShell-9e4e07f1)

**Usage**

I already packaged choco.exe in the .intunewin format so It is ready for you to upload into Intune.

First let's create a new Win32 application in intune.
![AddApp](https://github.com/insignit/ChocoTune/blob/master/Documentation/addapp.JPG)




