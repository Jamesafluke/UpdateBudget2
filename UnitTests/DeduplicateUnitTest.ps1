. $PSScriptRoot\Modules\Deduplicate.ps1

$accountHistory = Import-Csv $PSScriptRoot/accountHistory.csv
$existingBudget = Import-Csv $PSScriptRoot/existingBudget.csv

Write-Host $accountHistory
Write-Host $existingBudget


$result = Deduplicate $accountHistory $existingBudget

if ($result.count -eq 6){
    Write-Host "Count is correct." -ForegroundColor Green
}


