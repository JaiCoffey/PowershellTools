$user= get-localUser -name "GRPUSER"
if ($user -ne $null){Exit "1"}