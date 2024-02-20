function OpenXlsx{
    param(
        $xlsxPath
    )
    $userInput = Read-Host "Open Budget? y/n"
    if($userInput -eq "y"){
        Invoke-Item $xlsxPath
    }
}
