$i = 1
$string = "Hello World"
$this_is_Variable = "test"
$date = Get-Date

Write-Host "Today is" $date
Write-Host $i
Write-Host $string
Write-Host $this_is_Variable

# Data Types

# GetType().Name

Write-Host "i is a" $i.GetType().Name " Data type."
Write-Host "String is a" $string.GetType().Name " Data type."
Write-Host "This_is_a_Variable is a "$this_is_Variable.GetType().Name " Data type."
Write-Host "Date is a " $date.GetType().Name " Data type."
