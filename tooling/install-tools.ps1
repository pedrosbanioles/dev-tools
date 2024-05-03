param (
    [String]
    [Parameter(Mandatory=$true)]
    $suite 
)

if ($suite -eq "all" -or $suite -eq "dev") {
    winget install ./lists/dev.lst
}