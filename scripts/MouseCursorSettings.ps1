
$regpath = "HKCU:\Control Panel\Cursors"
$cursorpath = "%LocalAppData%\Microsoft\Windows\Cursors\"

$suffix = "_eoa.cur"
$settings = @(@{Path="."; Force=$true; PropertyType="String";       Name="(Default)";     Value="Windows Inverted"}
              @{Path="."; Force=$true; PropertyType="DWord";        Name=CursorBaseSize;  Value=64}
              @{Path="."; Force=$true; PropertyType="DWord";        Name="Scheme Source"; Value=2}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=Appstarting;     Value=$cursorpath + "busy"   +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=Arrow;           Value=$cursorpath + "arrow"  +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=Crosshair;       Value=$cursorpath + "cross"  +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=Hand;            Value=$cursorpath + "link"   +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=Help;            Value=$cursorpath + "helpsel"+$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=IBeam;           Value=$cursorpath + "ibeam"  +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=No;              Value=$cursorpath + "no"     +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=NWPen;           Value=$cursorpath + "pen"    +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=Person;          Value=$cursorpath + "person" +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=Pin;             Value=$cursorpath + "pin"    +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=SizeAll;         Value=$cursorpath + "move"   +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=SizeNESW;        Value=$cursorpath + "nesw"   +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=SizeNS;          Value=$cursorpath + "ns"     +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=SizeNWSE;        Value=$cursorpath + "nwse"   +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=SizeWE;          Value=$cursorpath + "ew"     +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=UpArrow;         Value=$cursorpath + "up"     +$suffix}
              @{Path="."; Force=$true; PropertyType="ExpandString"; Name=Wait;            Value=$cursorpath + "wait"   +$suffix}
             )

Set-Location $regpath #set location to registry folder where we will make all changes
foreach ($regkey in $settings) {
#    New-ItemProperty @regkey #create all the registry keys
    Write-Debug "Setting: " + $regkey
}
#$settings.ForEach(New-ItemProperty @_) #alternative method testing


#Set Mouse Pointer Scheme to Windows Inverted, large size
New-ItemProperty -Path $regpath -Name "(Default)"      -Value "Windows Inverted"                    -PropertyType String       -Force
New-ItemProperty -Path $regpath -Name CursorBaseSize   -Value 64                                    -PropertyType DWord        -Force
New-ItemProperty -Path $regpath -Name "Scheme Source"  -Value 2                                     -PropertyType DWord        -Force
New-ItemProperty -Path $regpath -Name AppStarting      -Value ($cursorpath + "busy"   + "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Arrow            -Value ($cursorpath + "arrow"  + "_eoa.cur") -PropertyType ExpandString -Force #same
New-ItemProperty -Path $regpath -Name Crosshair        -Value ($cursorpath + "cross"  + "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Hand             -Value ($cursorpath + "link"   + "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Help             -Value ($cursorpath + "helpsel"+ "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name IBeam            -Value ($cursorpath + "ibeam"  + "_eoa.cur") -PropertyType ExpandString -Force #same
New-ItemProperty -Path $regpath -Name No               -Value ($cursorpath + "no"     + "_eoa.cur") -PropertyType ExpandString -Force #same
New-ItemProperty -Path $regpath -Name NWPen            -Value ($cursorpath + "pen"    + "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Person           -Value ($cursorpath + "person" + "_eoa.cur") -PropertyType ExpandString -Force #same
New-ItemProperty -Path $regpath -Name Pin              -Value ($cursorpath + "pin"    + "_eoa.cur") -PropertyType ExpandString -Force #same
New-ItemProperty -Path $regpath -Name SizeAll          -Value ($cursorpath + "move"   + "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name SizeNESW         -Value ($cursorpath + "nesw"   + "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name SizeNS           -Value ($cursorpath + "ns"     + "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name SizeNWSE         -Value ($cursorpath + "nwse"   + "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name SizeWE           -Value ($cursorpath + "ew"     + "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name UpArrow          -Value ($cursorpath + "up"     + "_eoa.cur") -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Wait             -Value ($cursorpath + "wait"   + "_eoa.cur") -PropertyType ExpandString -Force #same
 
#Enable Pointer Option: Show location of pointer when I press the CTRL key
# not sure about this, as we should actually be doing a bitwise OR operation from previous result to our desired result to get the actual mask
# as I have foudn it to be different in different parts of the registry. 
#New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name UserPreferencesMask -Value  ([byte[]](0x9E,0x5E,0x07,0x80,0x12,0x00,0x00,0x00)) -PropertyType Binary -Force