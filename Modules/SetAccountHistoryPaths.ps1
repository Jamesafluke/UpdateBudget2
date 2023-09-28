

function SetAccountHistoryPaths{
    $accountHistoryPaths = @()
    if($env:computername -eq "PC_JFLUCKIGER"){
        Write-Host "Laptop detected."
        $accountHistoryPaths = @(
            "C:\Users\jfluckiger\Downloads\AccountHistory.csv",
            "C:\Users\jfluckiger\Downloads\AccountHistory (1).csv"            
            )
        }else{
            $accountHistoryPaths = @(
                Write-Host "Desktop detected."
                "C:\Users\james\Downloads\AccountHistory.csv",
                "C:\Users\james\Downloads\AccountHistory (1).csv"
                )
            }
            return $accountHistoryPaths
        }