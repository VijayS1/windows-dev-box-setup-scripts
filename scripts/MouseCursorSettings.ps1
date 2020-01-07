
$regpath = "HKCU:\Control Panel\Cursors"
$cursorpath = "%LocalAppData%\Microsoft\Windows\Cursors\"

$settings = @(@{Path=$regpath;Name="(Default)";Value="Windows Inverted";PropertyType="String";Force=$true},
              @{Path=$regpath;Name="CursorBaseSize";Value=64;PropertyType="DWord";Force=$true}
             )
             
#set location to registry folder where we will make all changes
#Set-Location $regpath
#Set Mouse Pointer Scheme to Windows Inverted, large size

New-ItemProperty -Path $regpath -Name "(Default)"      -Value "Windows Inverted"                 -PropertyType String       -Force
New-ItemProperty -Path $regpath -Name "CursorBaseSize" -Value 64                                 -PropertyType DWord        -Force
New-ItemProperty -Path $regpath -Name "Scheme Source"  -Value 2                                  -PropertyType DWord        -Force
New-ItemProperty -Path $regpath -Name AppStarting      -Value ($cursorpath + "busy_eoa.cur")     -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Arrow            -Value ($cursorpath + "arrow_eoa.cur")    -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Crosshair        -Value ($cursorpath + "cross_eoa.cur")    -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Hand             -Value ($cursorpath + "link_eoa.cur")     -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Help             -Value ($cursorpath + "helpsel_eoa.cur")  -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name IBeam            -Value ($cursorpath + "ibeam_eoa.cur")    -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name No               -Value ($cursorpath + "no_eoa.cur")       -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name NWPen            -Value ($cursorpath + "pen_eoa.cur")      -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Person           -Value ($cursorpath + "person_eoa.cur")   -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Pin              -Value ($cursorpath + "pin_eoa.cur")      -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name SizeAll          -Value ($cursorpath + "move_eoa.cur")     -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name SizeNESW         -Value ($cursorpath + "nesw_eoa.cur")     -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name SizeNS           -Value ($cursorpath + "ns_eoa.cur")       -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name SizeNWSE         -Value ($cursorpath + "nwse_eoa.cur")     -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name SizeWE           -Value ($cursorpath + "ew_eoa.cur")       -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name UpArrow          -Value ($cursorpath + "up_eoa.cur")       -PropertyType ExpandString -Force
New-ItemProperty -Path $regpath -Name Wait             -Value ($cursorpath + "wait_eoa.cur")     -PropertyType ExpandString -Force
 
#Enable Pointer Option: Show location of pointer when I press the CTRL key
# not sure about this, as we should actually be doing a bitwise OR operation from previous result to our desired result to get the actual mask
# as I have foudn it to be different in different parts of the registry. 
#New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name UserPreferencesMask -Value  ([byte[]](0x9E,0x5E,0x07,0x80,0x12,0x00,0x00,0x00)) -PropertyType Binary -Force