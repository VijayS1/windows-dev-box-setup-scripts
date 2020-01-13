Push-Location "HKCU:\Control Panel\Cursors" #set location to registry folder where we will make all changes
$cursorpath = "%LocalAppData%\Microsoft\Windows\Cursors\" #this references the environment variable directly
# if i use $env:LOCALAPPDATA, then it expands it to the absolute path, which seems to be default behavior for windows now. Keep absolutes in registry
$suffix = "_eoa.cur"

$settings = @(@{Path="."; Force=$true; PropertyType="String";       Name="(Default)";       Value="Windows Inverted"}
              @{Path="."; Force=$true; PropertyType="DWord";        Name="CursorBaseSize";  Value=64}
              @{Path="."; Force=$true; PropertyType="DWord";        Name="Scheme Source";   Value=2}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="Appstarting";     Value=$cursorpath + "busy"   +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="Arrow";           Value=$cursorpath + "arrow"  +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="Crosshair";       Value=$cursorpath + "cross"  +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="Hand";            Value=$cursorpath + "link"   +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="Help";            Value=$cursorpath + "helpsel"+$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="IBeam";           Value=$cursorpath + "ibeam"  +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="No";              Value=$cursorpath + "no"     +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="NWPen";           Value=$cursorpath + "pen"    +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="Person";          Value=$cursorpath + "person" +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="Pin";             Value=$cursorpath + "pin"    +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="SizeAll";         Value=$cursorpath + "move"   +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="SizeNESW";        Value=$cursorpath + "nesw"   +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="SizeNS";          Value=$cursorpath + "ns"     +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="SizeNWSE";        Value=$cursorpath + "nwse"   +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="SizeWE";          Value=$cursorpath + "ew"     +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="UpArrow";         Value=$cursorpath + "up"     +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name="Wait";            Value=$cursorpath + "wait"   +$suffix}
             )

#$DebugPreference = "Continue"
foreach ($regkey in $settings) {
    New-ItemProperty @regkey #create all the registry keys
    Write-Debug ($regkey | Out-String)
}
Remove-Variable cursorpath
Pop-Location
#$settings.ForEach(New-ItemProperty @_) #alternative method testing


#Enable Pointer Option: Show location of pointer when I press the CTRL key
# not sure about this, as we should actually be doing a bitwise OR operation from previous result to our desired result to get the actual mask
# as I have foudn it to be different in different parts of the registry. 
#New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name UserPreferencesMask -Value  ([byte[]](0x9E,0x5E,0x07,0x80,0x12,0x00,0x00,0x00)) -PropertyType Binary -Force

#Refresh cursors? 
# don't know if i need to refresh cursor, like it suggests here. https://devblogs.microsoft.com/scripting/use-powershell-to-change-the-mouse-pointer-scheme/
