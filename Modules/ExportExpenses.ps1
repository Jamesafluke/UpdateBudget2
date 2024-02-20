function ExportExpenses{
    param(
        $verifiedExpenses,
        $outputPath
    )
    $expenseCount = $verifiedExpenses.Count
    if ($expenseCount -ne 0){
        Write-Host "Exporting Box" -NoNewLine; Write-Host $expenseCount -NoNewLine -ForegroundColor Green; Write-Host " expenses." 
        while($true){
            try{
                $verifiedExpenses | Export-Csv $outputPath -NoTypeInformation
                Write-Host "Export successful."
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
        Write-Host "No expenses to export." -Foregroundcolor Green
    }
}