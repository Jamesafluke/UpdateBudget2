
function main{
    . $PSScriptRoot\..\Modules\Deduplicate.ps1
    
    $accountHistory = Import-Csv $PSScriptRoot/accountHistory.csv
    $existingBudget = Import-Csv $PSScriptRoot/existingBudget.csv

    # Write-Host "Here's the accountHistory"
    # Write-Host $accountHistory
    # Write-Host "Here's the existingBudget"
    # Write-Host $existingBudget

    $verifiedExpenses = Deduplicate $accountHistory $existingBudget
    
    Write-Host "`n`n -----Running unit tests!-----`n"
    if(!(TestTotalCount $verifiedExpenses)){
        Write-Host "TestTotalCount failed." -ForegroundColor Red
    }else{
        Write-Host "TestTotalCount succeeded" -ForegroundColor Green
    }
    if(!(TestRewardMethod $verifiedExpenses)){
        Write-Host "TestRewardMethod failed." -ForegroundColor Red
    }else{
        Write-Host "TestRewardMethod succeeded" -ForegroundColor Green
    }
    if(!(TestCheckingMethod $verifiedExpenses)){
        Write-Host "TestCheckingMethod failed." -ForegroundColor Red
    }else{
        Write-Host "TestCheckingMethod succeeded" -ForegroundColor Green
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

# Check if it returns with the right payment method; the right number of Checking and the right number of Rewards.
function TestRewardMethod{
    param(
        $verifiedExpenses
    )
    $rewardCount = 0
    foreach($item in $verifiedExpenses){
        if($item.method -eq "Rewards"){
            $rewardCount ++
        }
    }
    if($rewardCount -eq 3){
        return $true
    }else{
        return $false
    }
}

function TestCheckingMethod{
    param(
        $verifiedExpenses
    )
    $checkingCount = 0
    foreach($item in $verifiedExpenses){
        if($item.method -eq "Checking"){
            $checkingCount ++
        }
    }
    if($checkingCount -eq 2){
        return $true
    }else{
        return $false
    }
}

    # Check if it's converting credit (negatives) correctly.
    
    
    # Check if it returns arbitrary exceptions correctly.



Main


# Check if it's counting existing budget items correctly. - Probably not good because it's only testing a $existingBudget.Count
# Check if it correctly leaves out pending transactions.
# Check if it leaves out the duplicated items upon return.
