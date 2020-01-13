# Description: Boxstarter Script
# Author: Vijay
# how to run? Visit the url below in a browser
# it will launch a one-click application
# http://boxstarter.org/package/url?https://raw.githubusercontent.com/VijayS1/windows-dev-box-setup-scripts/master/vj_pc.ps1

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	Invoke-Expression ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "FileExplorerSettings.ps1";
executeScript "SystemConfiguration.ps1";
executeScript "CommonDevTools.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "HyperV.ps1";
executeScript "Docker.ps1";
executeScript "WSL.ps1";
executeScript "Browsers.ps1";
executeScript "VJApps.ps1";
executeScript "MouseCursorSettings.ps1"; #moved below because it was causing problems with the other scripts I believe.

#--- Tools ---
choco install -y visualstudio2019community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
#this will work only if code is in path
code --install-extension nonoroazoro.syncing #To sync VSCode
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.debugger-for-firefox
#code --install-extension msjsdiag.debugger-for-edge


Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
