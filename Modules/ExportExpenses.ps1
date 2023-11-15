function ExportExpenses{
    param(
        $verifiedExpenses,
        $outputPath
    )
    $expenseCount = $verifiedExpenses.Count
    Write-Host "Exporting " -NoNewLine; Write-Host $expenseCount -NoNewLine -ForegroundColor Green; Write-Host " expenses." 
    while($true){
        try{
            $verifiedExpenses | Export-Csv $outputPath -NoTypeInformation
            Write-Host "Export successful."
            break
        }
        catch{
            Write-Host "Exporting failed. Make sure output.csv is closed."
            $userInput = Read-Host "Try again? y/n"
            if($userInput -ne "y"){
                exit
            }
        }
    }
}