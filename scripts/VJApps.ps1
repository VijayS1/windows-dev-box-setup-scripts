
    #############Optional stuff
    #cinst boxstarter
    #synergy #old version 1.8.8. disable autostart
    #manictime.portable #better than rescuetime #seems to be newer than the install version. 4.3.4
    #choco install office365proplus --params '/ConfigPath:c:\myConfig.xml
    ##########editors
    #everything
    ##############productivity
    #cinst evernote
    #############cloud
    ##############media
    ##############remote
    #realvnc #5.3.1
    ##########browsers -  taken care of by Browsers.ps1
    ###########utilities - taken care of by commondevtools.ps1

    $applicationList = @(
    "directoryopus"
    "manictime.install"
    "nfopad"
    "notepad2"
    "notepadplusplus"
    "stardock-fences"
    "ditto"
    "listary"
    "autohotkey"
    "lastpass"
    "google-hangouts-chat"
    "office365ProPlus"
    "dropbox"
    "googledrive"
    "resilio-sync-home"
    "vlc"
    "teamviewer12"
    "vnc-connect"
    "chocolateygui"
    )
    
    function cinstApp {
        Param ([string]$appName)
        #write-output "choco install -ys $appName" #DEBUG
        #choco info -y $appName #for debugging
        choco install -y $appName
    }
    
    foreach ($app in $applicationList) {
        cinstApp $app
    }
    