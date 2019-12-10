
$applicationList = @(
    #############Optional stuff
    #cinst boxstarter
    #synergy #old version 1.8.8. disable autostart
    "directoryopus"
    #manictime.portable #better than rescuetime #seems to be newer than the install version. 4.3.4
    "manictime.install"
    #choco install office365proplus --params '/ConfigPath:c:\myConfig.xml
    ##########editors
    "nfopad"
    "notepad2"
    "notepadplusplus"
    #everything
    ##############productivity
    #cinst evernote
    "stardock-fences"
    "ditto"
    "listary"
    "autohotkey"
    "lastpass"
    "google-hangouts-chat"
    "office365ProPlus"
    #############cloud
    "dropbox"
    "googledrive"
    "resilio-sync-home"
    ##############media
    "vlc"
    ##############remote
    "teamviewer12"
    "vnc-connect"
    #realvnc #5.3.1
    ##########browsers -  taken care of by Browsers.ps1
    ###########utilities - taken care of by commondevtools.ps1
    "chocolateygui"
    )
    
    function cinstApp {
        Param ([string]$appName)
        write-output "choco install -ys $appName"
    }
    
    foreach ($app in $applicationList) {
        cinstApp $app
    }
    