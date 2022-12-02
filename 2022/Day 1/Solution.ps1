#Loop through each elf adding calories, check if larger than the previous largest update largest if true
$input = (Get-Content -Path .\input.txt) 
$input += "`n"
$input = $input.Split("`n")#([System.Environment]::NewLine)

Clear-Content -path .\output.txt
$output = ""

$Cal = 0
$i = 0
$ElfHash = [ordered]@{}
foreach ($line in $input) {

    if ($line) {
        $Cal += [int]$line
    }
    elseif ($Cal -gt 0) {
        $i += 1
        $ElfHash.add("Elf $($i)", $Cal)
        $Cal = 0
    }
}

foreach ($elf in $ElfArray) {
    
}
$top3 = $ElfHash.getEnumerator() | sort value | select -last 3
$total = 0
foreach ($elf in $top3) {
    $Output += "Elf $($elf.name) has $($elf.Value) Calories`n"
    $total += $elf.value
}
$output += "The top three elves have $total Calories"
$output >> .\output.txt