
# tools we expect devs across many scenarios will want
choco install -y vscode
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco install -y python
choco install -y 7zip.install
#choco install -y sysinternals #already part of my portable collection

#--- Tools ---
choco install -y visualstudio2019community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
#this will work only if code is in path
code --install-extension nonoroazoro.syncing #To sync VSCode
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.debugger-for-firefox
#code --install-extension msjsdiag.debugger-for-edge