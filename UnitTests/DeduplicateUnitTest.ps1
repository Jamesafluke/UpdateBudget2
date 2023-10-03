

    . $PSScriptRoot\..\Modules\Deduplicate.ps1
    
    $accountHistory = Import-Csv $PSScriptRoot/accountHistory.csv
    $existingBudget = Import-Csv $PSScriptRoot/existingBudget.csv

    Write-Host "Here's the accountHistory"
    Write-Host $accountHistory
    Write-Host "Here's the existingBudget"
    Write-Host $existingBudget


    $verifiedExpenses = Deduplicate $accountHistory $existingBudget
    
    if ($verifiedExpenses.count -eq 11){
        Write-Host "Total count is correct." -ForegroundColor Green
    }else{
        Write-Host "Total count failed" -ForegroundColor Green
    }



