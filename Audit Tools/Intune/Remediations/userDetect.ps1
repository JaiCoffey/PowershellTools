$user= get-localUser -name "user" #set old acct name in ""
if ($user -ne $null){exit 1}