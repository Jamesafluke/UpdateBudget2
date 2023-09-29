function ExportExpenses{
    param(
        $verifiedExpenses,
        $outputPath
    )
    Write-Host "Exporting!"
    $verifiedExpenses | Export-Csv $outputPath -NoTypeInformation
}