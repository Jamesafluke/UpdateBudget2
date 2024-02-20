

function SetAccountHistoryPaths{
    
    $accountHistoryPaths = @()
    if($env:computername -eq "PC_JFLUCKIGER"){
        LogMessage $MyInvocation.MyCommand.Name "Laptop detected."
        $accountHistoryPaths = @(
            "C:\Users\jfluckiger\Downloads\AccountHistory.csv",
            "C:\Users\jfluckiger\Downloads\AccountHistory (1).csv"            
        )
    }else{
        $accountHistoryPaths = @(
            LogMessage $MyInvocation.MyCommand.Name "Desktop detected."
                "C:\Users\james\Downloads\AccountHistory.csv",
                "C:\Users\james\Downloads\AccountHistory (1).csv"
        )
    }
    return $accountHistoryPaths
}