$input = (Get-Content -Path .\input.txt).split([System.Environment]::NewLine)
Clear-Content -path .\output.txt
$output
$Priority = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$value = 0
foreach ($line in $input) {
    $halflength = ($line.Length / 2)
    $split = $line -split "(\w{$halflength})" | ? { $_ } 
    $array = $split[0].tochararray()
    foreach ($char in $array) {
        # write-host $char
        if ($split[1] -clike "*$($char)*") {
            $value += $priority.IndexOf($char) + 1
            break
        }

    }
}
$output += "Part 1:`n"
$output += "The total priority is $value`n"
$output += "Part 2:`n"



# $output += ""
$output >> .\output.txt