param (
    [String]
    [Parameter(Mandatory=$true)]
    $suite 
)
$chosenSuites = $suite -split ","
$installList = @()
$chocoList = @()
$workflowList = @("creative";"browsers";"security";"social";"video";"dev")

if ($suite -eq "all" -or $chosenSuites.Contains("pkg") -or $chosenSuites.Contains("utilities")) 
{
    $installList = $($installList; ((Get-Content ./lists/pkg.lst) -split [Environment]::NewLine))
    
    if ($suite -eq "all" -or $chosenSuites.Contains("utilities"))
    {
        $installList = $($installList; ((Get-Content ./lists/utilities.lst) -split [Environment]::NewLine))
        $chocoList += "./lists/utilities.choco.lst"
    }
}

foreach ($workflow in $workflowList) 
{
    if ($suite -eq "all" -or $chosenSuites.Contains($workflow)) 
    {
        $installList = $($installList; ((Get-Content "./lists/$workflow.lst") -split [Environment]::NewLine))
    }
}

foreach ($id in $installList) {
    if (-not $id.StartsWith('#'))
    {
        Write-Host "Installing $id"
        winget install --id $id --accept-package-agreements
    } 
} 

foreach ($id in $chocoList) {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
    choco install (((Get-Content ./lists/utilities.choco.lst) -split [Environment]::NewLine) -join ";")
}
