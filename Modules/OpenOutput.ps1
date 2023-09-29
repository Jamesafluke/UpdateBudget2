function OpenOutput{
    param(
        $outputPath
    )
    $userInput = Read-Host "Open output.csv? y/n"
    if($userInput -eq "y"){
        Invoke-Item $outputPath
    }
}
