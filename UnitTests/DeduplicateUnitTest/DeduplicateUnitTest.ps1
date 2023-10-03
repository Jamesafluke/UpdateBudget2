
function main{
    . $PSScriptRoot\..\Modules\Deduplicate.ps1
    
    $accountHistory = Import-Csv $PSScriptRoot/accountHistory.csv
    $existingBudget = Import-Csv $PSScriptRoot/existingBudget.csv

    # Write-Host "Here's the accountHistory"
    # Write-Host $accountHistory
    # Write-Host "Here's the existingBudget"
    # Write-Host $existingBudget

    $verifiedExpenses = Deduplicate $accountHistory $existingBudget
    
    Write-Host "Verified Expenses:"
    foreach($item in $verifiedExpenses){
        Write-Host "$item"
    }

    Write-Host "`n`n -----Running deduplicate unit tests!-----`n"
    if(!(TestTotalCount $verifiedExpenses)){
        Write-Host "TestTotalCount failed." -ForegroundColor Red
    }else{
        Write-Host "TestTotalCount succeeded" -ForegroundColor Green
    }
}


# Check if it returns the right number of items.
function TestTotalCount{
    param(
        $verifiedExpenses
    )
    if ($verifiedExpenses.count -eq 5){
        return $true
    }else{
        return $false
    }
}

Main


# Check if it returns with the right payment method; the right number of Checking and the right number of Rewards.
# Check if it's converting credit (negatives) correctly.
# Check if it's counting existing budget items correctly. - Probably not good because it's only testing a $existingBudget.Count
# Check if it correctly leaves out pending transactions.
# Check if it leaves out the duplicated items upon return.
