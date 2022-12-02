$input = (Get-Content -Path .\input.txt).split([System.Environment]::NewLine)
Clear-Content -path .\output.txt
$output = ""

$totalpoints = 0

foreach ($line in $input) {
    $points = 0
    switch ($Line[2]) {
        "X" { $points += 1; if ($line[0] -eq "A") { $points += 3 }elseif ($line[0] -eq "B") { $points += 0 }elseif ($line[0] -eq "C") { $points += 6 } }
        "Y" { $points += 2; if ($line[0] -eq "A") { $points += 6 }elseif ($line[0] -eq "B") { $points += 3 }elseif ($line[0] -eq "C") { $points += 0 } }
        "Z" { $points += 3; if ($line[0] -eq "A") { $points += 0 }elseif ($line[0] -eq "B") { $points += 6 }elseif ($line[0] -eq "C") { $points += 3 } }
    }
    $totalpoints += $points   
}
$output += "Part 1:`n"
$output += "You will score $Totalpoints points`n"
$output += "Part 2:`n"
$totalpoints = 0
foreach ($line in $input) {
    $points = 0
    $YourInput = ""
    switch ($Line[2]) {
        "X" { if ($line[0] -eq "A") { $YourInput = "C" }elseif ($line[0] -eq "B") { $YourInput = "A" }elseif ($line[0] -eq "C") { $YourInput = "B" } }
        "Y" { if ($line[0] -eq "A") { $YourInput = "A" }elseif ($line[0] -eq "B") { $YourInput = "B" }elseif ($line[0] -eq "C") { $YourInput = "C" } }
        "Z" { if ($line[0] -eq "A") { $YourInput = "B" }elseif ($line[0] -eq "B") { $YourInput = "C" }elseif ($line[0] -eq "C") { $YourInput = "A" } }
    }
    switch ($YourInput) {
        "A" { $points += 1; if ($line[0] -eq "A") { $points += 3 }elseif ($line[0] -eq "B") { $points += 0 }elseif ($line[0] -eq "C") { $points += 6 } }
        "B" { $points += 2; if ($line[0] -eq "A") { $points += 6 }elseif ($line[0] -eq "B") { $points += 3 }elseif ($line[0] -eq "C") { $points += 0 } }
        "C" { $points += 3; if ($line[0] -eq "A") { $points += 0 }elseif ($line[0] -eq "B") { $points += 6 }elseif ($line[0] -eq "C") { $points += 3 } }
    }
    $totalpoints += $points   
}
$output += "You will score $Totalpoints points"
$output >> .\output.txt