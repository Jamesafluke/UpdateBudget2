function Deduplicate{
    param(
        $accountHistory,
        $existingBudget
    )

    Write-Host "Existing budget data has " -NoNewLine; Write-Host $existingBudget.Count -NoNewLine -ForegroundColor Green; Write-Host " items."
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
            
            # Write-Host "NON-duplicate entry found:"
            # Write-Host $entry

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
            # Write-Host "Duplicate entry found" -ForegroundColor Yellow
            # Write-Host $entry
            $duplicateCount ++
        }
    }        
    Write-Host $duplicateCount -NoNewLine -ForegroundColor Green; Write-Host " duplicates. There are " -NoNewLine; Write-Host $verifiedExpenses.count -NoNewLine -ForegroundColor Green; Write-Host " expenses before arbitrary exceptions."
    return $verifiedExpenses
}
