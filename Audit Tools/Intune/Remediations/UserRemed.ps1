# Renames old local admin account to a new standard and sets dynamic password based on serial number with appended symbol

#Get serial number and create new password from it
$Sysinfo= Get-WmiObject win32_bios
$serialPass= $Sysinfo.serialnumber+"" # put symbol of choice in "" I.E ! or @
#set password to secure string 
$newPass= ConvertTo-SecureString $serialPass -AsPlainText -Force
$newname=""
$oldname=""
#rename account and reset password
Rename-LocalUser -Name $oldname -NewName $newname
Set-LocalUser -Name $newname -Password $newPass
$user= get-localUser -name $newname
if ($user -ne $null){exit 0}