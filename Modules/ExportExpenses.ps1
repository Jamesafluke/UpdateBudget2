function ExportExpenses{
    param(
        $verifiedExpenses,
        $outputPath
    )

    #Temp veriables while I convert this away from csv.
    $exportToCsv = $true
    $xlsxOutputPath = "C:\PersonalMyCode\UpdateBudget2\testBudget.xlsx"


    $expenseCount = $verifiedExpenses.Count
    if ($expenseCount -ne 0){
        LogMessage $MyInvocation.MyCommand.Name "Exporting $expenseCount expenses to xlsx." 

        if($exportToCsv){
            while($true){
                try{
                    $verifiedExpenses | Export-Csv $outputPath -NoTypeInformation
                    LogMessage $MyInvocation.MyCommand.Name "Export to csv successful."
                    break
                }
                catch{
                    $userInput = Read-Host "Exporting failed. Make sure output.csv is closed. Try again? y/n"
                    if($userInput -ne "y"){
                        exit
                    }
                }
            }
        }
        else{#Export to the budget xlsx.
            while($true){
                try{
                    # $verifiedExpenses | Export-Csv $outputPath -NoTypeInformation
                    LogMessage $MyInvocation.MyCommand.Name "Export successful."
                    Write-Host $verifiedExpenses
                    $verifiedExpenses | Export-Excel -Path $xlsxOutputPath -NoTypeInformation
                    # $verifiedExpenses | Export-Excel -Path $xlsxOutputPath -AutoSize -AutoFilter -FreezeTopRow -BoldTopRow -StartRow 8 -StartColumn 19
                    break
                }
                catch{
                    $userInput = Read-Host "Exporting failed. Make sure the xlsx is closed. Try again? y/n"
                    if($userInput -ne "y"){
                        exit
                    }
                }
            }
        }
    }else{
        LogMessage $MyInvocation.MyCommand.Name "No expenses to export." -Foregroundcolor Green
    }
}