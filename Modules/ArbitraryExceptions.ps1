function ArbitraryExceptions {
    param (
        $verifiedExpenses
    )
    # Write-Host "Here's ArbitraryExceptions"
    # Write-Host $verifiedExpenses

    forEach($entry in $verifiedExpenses){
        if ($entry.Item -eq "PennyMac") {
            $entry.Description = "Mortgage"
            $entry.Category = "Mortgage"
        }
        if ($entry.Item -eq "Walmart") {
            $entry.Category = "Groceries"
        }
        if ($entry.Item -eq "Payson City Debits") {
            $entry.Description = "Electricity"
            $entry.Category = "Electricity"
        }
        if ($entry.Item -eq "Wasatch Property") {
            $entry.Description = "HOA"
            $entry.Category = "HOA"
        }
        if ($entry.Item -eq "Maverik") {
            $entry.Description = "Gasoline"
            $entry.Category = "Gasoline"
        }
        if ($entry.Item -eq "American Funds") {
            $entry.Description = "This will become millions"
            $entry.Category = "Investment"
        }
        if ($entry.Item -eq "Allstate") {
            $entry.Description = "Car Insurance"
            $entry.Category = "Car Insurance"
        }
        if ($entry.Item -eq "Fast Gas Convenience Store") {
            $entry.Description = ""
            $entry.Category = ""
        }
        if ($entry.Item -eq "Dep Cloud Bee Direct Deposit") {
            $entry.amount = ""
        }
        if ($entry.Item -eq "Dominion Energy") {
            $entry.Description = "Dominion Energy"
            $entry.Category = "Dominion"
        }
        if ($entry.Item -eq "Credit Card Payment") {
            $entry.amount = ""
        }            
        if ($entry.Item -eq "Fluckiger") {
            $entry.amount = ""
        }
        if ($entry.Item -eq "Costa Vida") {
            $entry.Description = ""
            $entry.Category = "Eating Out/Fun"
        }
        if ($entry.Item -eq "Xfinity Mobile") {
            $entry.Description = "Phones"
            $entry.Category = "Phones"
        }
        if ($entry.Item -eq "YouTube Premium") {
            $entry.Description = "YouTube Premium"
            $entry.Category = "YouTube Premium"
        }
        if ($entry.Item -eq "Costco Gas") {
            $entry.Description = "Gasoline"
            $entry.Category = "Gasoline"
        }
        if ($entry.Item -eq "Comcast") {
            $entry.Description = "Internet"
            $entry.Category = "Internet"
        }
        if ($entry.Item -eq "Chevron") {
            $entry.Description = "Gasoline"
            $entry.Category = "Gasoline"
        }

    }
    return $verifiedExpenses
}