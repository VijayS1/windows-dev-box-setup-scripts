
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
    $homeapplist = @(
        "steam"
        "discord"
        "popcorn-time" #older version in chocolatey though as of 2020-04-05
        "potplayer"
        "ds4windows"
        "forticlientvpn"
        "malwarebytes"
   )
    #optional "glasswire"
    #zerotier-one
    #radmin-vpn
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
     )
    function cinstApp {
        Param ([string[]]$appList = $(throw "Please pass the application(s) name you wish to install."))
        foreach ($appName in $appList) {
            Write-Debug "choco info $($appName)"
            choco install -y $appName
        }
    }
    
    cinstApp($applicationList)
    cinstApp($homeapplist)