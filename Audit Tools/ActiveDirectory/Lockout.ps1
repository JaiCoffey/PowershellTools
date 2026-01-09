<#
    Script by Jai Coffey 2025
    Purpose: To pull events (default is Lockout events AKA 4740) on a DC from an endpoint.
    How to use: 
        enter your DC's Hostname in the DCHostname variable and then run the script.
        if you'd like to look for a different event you can change the =param after instanceID variable to reflect the desired event id.
#>

$DCHostname = ""

$session= New-PSSession -ComputerName $DCHostname #creates new session on DC
Invoke-Command -Session $session -ScriptBlock {# enters the above session and starts remote commands
    #Start of Remote commands
    $Events=Get-EventLog -LogName Security -InstanceId 4740 #pull lock out event from Event viewer
    foreach ($eventlog in $Events){ #loops through the pulled events and outputs them to the term with a visual seperator
        write-host $eventlog.Message 
        Write-Host "-----------------" 
    }   
}
#End of Remote Commands
$session|Remove-PSSession #closes Remote session to DC
Read-Host # holds terminal open to be read by user