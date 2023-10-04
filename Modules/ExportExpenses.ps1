function ExportExpenses{
    param(
        $verifiedExpenses,
        $outputPath
    )
    Write-Host "Exporting!"
    while($true){
        try{
            $verifiedExpenses | Export-Csv $outputPath -NoTypeInformation
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