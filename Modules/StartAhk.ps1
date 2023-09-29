function StartAhk{
    $userInput = Read-Host "Download account history? y/n"
    if($userInput -eq "y"){
        if($env:computername -eq "PC_JFLUCKIGER"){
            Write-Host "Laptop AHK"
            Invoke-Item "C:\PersonalMyCode\UpdateBudget\AHK\laptopDownloadUccu.ahk"
        }
        else{
            Write-Host "Desktop AHK"
            Invoke-Item "C:\PersonalMyCode\UpdateBudget\AHK\desktopDownloadUccu.ahk"
        }
    }
}