# Automatic variables are built-in variables that are created and maintained by PowerShell

# The execution status of the last command. If the last command succeeded, it is set tu true otherwise false
$?

$_
# When processing a pipline object, $_ can be used to access the current object ($PSItem). It can also be used in commnds
# that execute an action on every item, as in the following example

Get-ChildItem -Path C:\ -Directory -Force -ErrorAction SilentlyContinue | ForEach-Object {Write-Host $_.DirectoryName}

$Error
# Contains the most recent errors, collected in an array. The most recent error can be found in $Error[0]

$false
# Represents the traditional Boolean value of False

$LASTEXITCODE
# contains the last exit code of the program that was run

$null
# Contains null or an empty value. It can be used to check whether a variable contains a value or to set an undefinede value when scripting,
# as $null is still treated like an object with a value.

$PSScriptRoot
# The location of the directory from which the script being run. It can help you to address relative paths.

$true
# Contains true. You can use $ture to represent True in command scripts

# Find more Info : https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-7.4

Write-Host $PWD