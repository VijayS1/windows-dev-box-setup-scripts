#require admin priveleges
Push-Location "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" #set location to registry folder where we will make all changes

$settings = @(@{Path="."; Force=$true; PropertyType="String"; Name="Manufacturer"; Value="Vijay's High End PCs"}
              @{Path="."; Force=$true; PropertyType="String"; Name="Model";         Value="OPC#1"}
              @{Path="."; Force=$true; PropertyType="String"; Name="SupportHours";  Value="24 hours"}
              @{Path="."; Force=$true; PropertyType="String"; Name="SupportPhone";  Value="You know it!"}
              @{Path="."; Force=$true; PropertyType="String"; Name="SupportURL";    Value="http://family.saraff.com"}
             )
#save existing data first

$DebugPreference = "Continue"
$ee = @() # Exception catcher

foreach ($regkey in $settings) {
    
    #Write-Debug ($regkey | Out-String)
    # $regkey.Remove("Value") # delete the unnecessary keys
    Write-Output $regkey.Name
    #if (Test-Path -Path $regkey.Name) {
    try {
        $keyvalue = Get-ItemPropertyValue -Name $regkey.Name -Path $regkey.Path
    }
    catch {
        $ee += $_
        #Write-Debug ($ee | Out-String)
        if ($ee.Exception.Message -match "does not exist") {
            $keyvalue = "Value doesn’t exist"
            New-ItemProperty @regkey #create all the registry keys
        }
    }
    #if ($ee.Exception.Message -match "Property $($regkey.Name) does not exist at path") {
    Write-Output  $keyvalue

}
Pop-Location