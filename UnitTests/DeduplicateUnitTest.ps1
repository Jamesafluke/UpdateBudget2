. $PSScriptRoot\Modules\Deduplicate.ps1

$accountHistory = Import-Csv $PSScriptRoot/accountHistory.csv
$existingBudget = Import-Csv $PSScriptRoot/existingBudget.csv

Write-Host "Here's the accountHistory"
Write-Host $accountHistory
Write-Host "Here's the existingBudget"
Write-Host $existingBudget


$verifiedExpenses = Deduplicate $accountHistory $existingBudget

if ($verifiedExpenses.count -eq 6){
    Write-Host "Count is correct." -ForegroundColor Green
}


