#Script used to create local Guest account through intune remdiation
#Set the ACC password name and desc below
$newPass= ConvertTo-SecureString "" -AsPlainText -Force
$newAccName =""
$newAccDesc = "New account made by intune"
#Creates New account
New-LocalUser -Name $newAccName -Description $newAccDesc -Password $newPass
#adds account to guest group
Add-LocalGroupMember -Name 'Guests' -Member "GRPUSER"
#checks if acc exsists
$user= get-localUser -name "GRPUSER"
#if acc exsists exit with success code for intune
if ($user -ne $null){exit 0}