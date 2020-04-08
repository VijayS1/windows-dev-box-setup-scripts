
    #############Optional stuff
    #cinst boxstarter
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

    #  $officeapplist = @(
    # )

    # $deprecatedlist = @(
    #     "nfopad"
    #     "notepad2"
    #     "dropbox"
    #     "stardock-fences" #install from steam
    #     )

    $applicationList = @(
    "directoryopus"
    "notepadplusplus"
    "ditto"
    "listary"
    "autohotkey"
    "lastpass"
    "google-hangouts-chat"
    "office365ProPlus"
    "google-backup-and-sync"
    "resilio-sync-home"
    "vlc"
    "teamviewer12"
    "vnc-connect"
    "chocolateygui"
    "manictime.install"
    "forticlientvpn"
    )
    function cinstApp {
        Param ([string]$appName)
        #write-debug "choco install -ys $appName" #DEBUG
        #write-debug "choco info -y $appName" #for debugging
        choco install -y $appName
    }
    
    foreach ($app in $applicationList) {
        cinstApp $app
    }
    