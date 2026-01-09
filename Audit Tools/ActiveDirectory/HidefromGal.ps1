#script to set older accounts not managed by exchonline to not show in GAL
Import-Module ActiveDirectory 
$users = Get-ADUser -Filter {(msExchHideFromAddressLists -eq $true)}

foreach($user in $users){
    write-host $user
    
    if($user.mailNickname -eq $null){
        Set-ADUser -Identity $user -Replace @{mailNickname=$user.sAMAccountName}
    }
  
}