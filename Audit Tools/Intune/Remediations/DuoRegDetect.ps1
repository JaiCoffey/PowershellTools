$DuoPath = "C:\Program Files\Duo Security\WindowsLogon\DuoCredFilter.dll" #file path for duo install
if(Test-Path $DuoPath){
    $uacsetting = Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\Duo Security\DuoCredProv" -name ElevationProtectionMode
    if($uacsetting -ne "2"){
        exit 1
    }
} 
else {
    #dies if duo isnt installed will check after duo installs again

    
    exit 0
}