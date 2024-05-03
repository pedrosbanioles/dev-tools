param (
    [String]
    [Parameter(Mandatory=$true)]
    $suite 
)
(Get-Content sandbox-template.wsb).replace('{{SANDBOX_ROOT}}', (Join-Path (Split-Path $PSScriptRoot) "tooling")) | Set-Content .\sandbox.wsb
(Get-Content sandbox.wsb).replace('{{SUITE}}', $suite) | Set-Content .\sandbox.wsb

.\sandbox.wsb