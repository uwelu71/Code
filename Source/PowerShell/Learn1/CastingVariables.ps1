$number = "4"
$number.GetType().Name

($number + 2).GetType().Name

#casting
$number = "4"
$int_number = [int]$number

$int_number + 2
$int_number.GetType().Name

# Cast Unicode hex string into character
[char]0x263a
