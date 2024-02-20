function Deduplicate{
    param(
        $accountHistory,
        $existingBudget
    )

    LogMessage $MyInvocation.MyCommand.Name "There are $($existingBudget.Count) items in the existing budget."
    $verifiedExpenses = @()

    $duplicateCount = 0
    foreach ($entry in $accountHistory) {
        $postDate = $entry."Post Date"
        $debit = [decimal]$entry."Debit"
        $credit = [decimal]$entry."Credit"

        #Set $amount.
        $amount = $null
        if ($debit -ne ""){
            $amount = $debit
        }else{
            $amount = $credit * -1
        }
        
        # Check if there's a matching entry in existing budget data
        $duplicateEntry = $existingBudget | Where-Object { $_.Date -eq $postDate -and [decimal]$_.Amount -eq $amount}

        if ($null -eq $duplicateEntry){ #If it isn't a duplicate entry, add it.
            # Add date, item, and amount. ()

            $newExpense = [PSCustomObject]@{
                Date = $entry."Post Date"
                Item = $entry.Description
                Description = ""
                Method = $entry."Account Number"
                Category = ""
                Amount = $amount
            }
            $verifiedExpenses += $newExpense
        }else{ #Is a duplicate entry.
            # LogMessage $MyInvocation.MyCommand.Name "Duplicate entry found" -ForegroundColor Yellow
            # LogMessage $MyInvocation.MyCommand.Name $entry
            $duplicateCount ++
        }
    }        
    LogMessage $MyInvocation.MyCommand.Name "There are $duplicateCount duplicates."
    LogMessage $MyInvocation.MyCommand.Name "There are $($verifiedExpenses.count) expenses before arbitrary exceptions."
    return $verifiedExpenses
}
