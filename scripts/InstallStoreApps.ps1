#--- Uninstall unnecessary applications that come with Windows out of the box ---
Write-Host "Manually install MS Store applications" -ForegroundColor "Yellow"

#Referenced to build script
# https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1
# https://github.com/kelps/repave-scripts/blob/master/install.bat


function addApp { #TODO: find a way to make it work without user interaction. 
	Param ([string]$appName)
	Write-Output "Trying to install $appName"
	Invoke-WebRequest -Uri https://aka.ms/$appName -OutFile ~/$appName.appx -UseBasicParsing
	Add-AppxPackage -Path ~/$appName.appx
	Get-AppxPackage $appName -AllUsers | Write-Output
	#Get-AppXProvisionedPackage -Online | Where DisplayName -like $appName | Remove-AppxProvisionedPackage -Online
}
function addAppManual { #TODO: find way to click only the "INSTALL" button, else error
	Param ([string]$appName, [string]$producId)
    $storeurl = "ms-windows-store://pdp/?ProductId=$producId"
    Write-Output "Trying to install $appName" $storeurl
    Start-Process $storeurl
    #wait for user action
    $ID = [System.Diagnostics.Process]::GetCurrentProcess().SessionId
    & msg.exe $ID /W 'Click Install in the store window then \n click OK here to open the next app"'
    #Start-Process PowerShell {[void][System.Console]::ReadKey($true)} -wait
}

#Get product ids, by going to the store and clicking Share & Copy URL, you will get a link like below
#https://www.microsoft.com/store/productId/9WZDNCRFJ2G6
#the last part is the productID which you can then put in the below hashtable

$storeApplications = @{
    whatsapp_desktop="9NKSQGP7F2NH";
    line            ="9WZDNCRFJ2G6";
    wechat          ="9NBLGGH4SLX7";
    skype           ="9WZDNCRFJ364";
    Plex="9WZDNCRFJ3Q8";
    #NugetPackageExplorer="9WZDNCRDMDM3";
    #netflix ="9WZDNCRFJ3TJ";
}

foreach($app in $storeApplications.Keys) {
    addAppManual $app $storeApplications[$app]
}

RefreshEnv

<# start "" ms-windows-store://pdp/?ProductId= @REM Paint.NET="9NBHCS1LX4R0"
@pause

start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K5DM @REM Office 365 Home
start "" ms-windows-store://pdp/?ProductId=9N8H1T7MZC7W @REM BrowserStack
@pause
start "" ms-windows-store://pdp/?ProductId=9MSPC6MP8FM4 @REM Microsoft Whiteboard
 #>