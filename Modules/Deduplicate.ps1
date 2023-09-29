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

        if ($null -eq $duplicateEntry){ #Isn't a duplicate entry.
            
            #Determine method.
            if ($entry."Account Number" -eq "313235393200"){
                $method = "Rewards"
            }elseif ($entry."Account Number" -eq "750501095729") {
                $method = "Checking"
            }
            
            #Arbitrary exceptions.
            if ($entry.Description -eq "PennyMac") {
                $description = "Mortgage"
                $category = "Mortgage"
            }
            if ($entry.Description -eq "Walmart") {
                $category = "Groceries"
            }
            if ($entry.Description -eq "Payson City Debits") {
                $description = "Electricity"
                $category = "Electricity"
            }
            if ($entry.Description -eq "Wasatch Property") {
                $description = "HOA"
                $category = "HOA"
            }
            if ($entry.Description -eq "Maverik") {
                $description = "Gasoline"
                $category = "Gasoline"
            }
            if ($entry.Description -eq "American Funds") {
                $description = "This will become millions"
                $category = "Investment"
            }
            if ($entry.Description -eq "Allstate") {
                $description = "Car Insurance"
                $category = "Car Insurance"
            }
            if ($entry.Description -eq "Fast Gas Convenience Store") {
                $description = ""
                $category = ""
            }
            if ($entry.Description -eq "Dep Cloud Bee Direct Deposit") {
                $amount = ""
            }
            if ($entry.Description -eq "Dominion Energy") {
                $description = "Dominion Energy"
                $category = "Dominion"
            }
            if ($entry.Description -eq "Credit Card Payment") {
                $amount = ""
            }            
            if ($entry.Description -eq "Fluckiger") {
                $amount = ""
            }
            if ($entry.Description -eq "Costa Vida") {
                $description = ""
                $category = "Eating Out/Fun"
            }
            if ($entry.Description -eq "Xfinity Mobile") {
                $description = "Phones"
                $category = "Phones"
            }
            if ($entry.Description -eq "YouTube Premium") {
                $description = "YouTube Premium"
                $category = "YouTube Premium"
            }
            if ($entry.Description -eq "Costco Gas") {
                $description = "Gasoline"
                $category = "Gasoline"
            }
            if ($entry.Description -eq "Comcast") {
                $description = "Internet"
                $category = "Internet"
            }
            if ($entry.Description -eq "Chevron") {
                $description = "Gasoline"
                $category = "Gasoline"
            }

            $newExpense = [PSCustomObject]@{
                Date = $entry."Post Date"
                Item = $entry.Description
                Description = $description
                Method = $method
                Category = $category
                Amount = $amount
            }
            $verifiedExpenses += $newExpense
        }else{ #Is a duplicate entry.
            $duplicateCount ++
        }
    }        
    Write-Host $duplicateCount -NoNewLine -ForegroundColor Green; Write-Host " duplicates. There are " -NoNewLine; Write-Host $verifiedExpenses.count -NoNewLine -ForegroundColor Green; Write-Host " expenses ready to be exported."
    return $verifiedExpenses
}
