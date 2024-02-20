function ExportExpenses{
    param(
        $verifiedExpenses,
        $outputPath
    )
    $expenseCount = $verifiedExpenses.Count
    if ($expenseCount -ne 0){
        LogMessage $MyInvocation.MyCommand.Name "Exporting $expenseCount expenses." 
        while($true){
            try{
                $verifiedExpenses | Export-Csv $outputPath -NoTypeInformation
                LogMessage $MyInvocation.MyCommand.Name "Export successful."
                break
            }
            catch{
                $userInput = Read-Host "Exporting failed. Make sure output.csv is closed. Try again? y/n"
                if($userInput -ne "y"){
                    exit
                }
            }
        }
    }else{
        LogMessage $MyInvocation.MyCommand.Name "No expenses to export." -Foregroundcolor Green
    }
}