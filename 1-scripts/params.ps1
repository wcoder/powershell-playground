
param (
    [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
    [string]$path
)

new-item -path $path
write-host "File $path was created!"