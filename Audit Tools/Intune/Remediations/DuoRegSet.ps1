## sets each reg value
$regpath = "HKLM:\SOFTWARE\Duo Security\DuoCredProv"
Set-ItemProperty -path $regpath -name AUTOPUSH -Value 1
Set-ItemProperty -path $regpath -name ElevationProtectionMode -Value 2
Set-ItemProperty -path $regpath -name ElevationOfflineEnable -Value 1 
Set-ItemProperty -path $regpath -name ElevationOfflineEnrollment -Value 1 
Set-ItemProperty -path $regpath -name EnableSmartCards -Value 0
Set-ItemProperty -path $regpath -name FailOpen -Value 1 
Set-ItemProperty -path $regpath -name OfflineAvailable -Value 1
Set-ItemProperty -path $regpath -name RdpOnly -Value 0 
Set-ItemProperty -path $regpath -name UsernameFormatForService -Value 1 
Set-ItemProperty -path $regpath -name WrapSmartCards -Value 1
$uacsetting = Get-ItemPropertyValue -Path $regpath -name ElevationProtectionMode
    if($uacsetting -eq "2"){
        exit 0
    }
