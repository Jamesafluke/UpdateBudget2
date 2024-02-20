. "$PSScriptRoot\GetFullMonthName.ps1"

function SelectMonth{
    $userInput = Read-Host "Use current month? y/n"
    if($userInput -eq 'y'){
        $selectedMonth = Get-Date -Format "MM"
    }else{
        $selectedMonth = Read-Host "Enter a number between 1 and 12 for the desired month"
    }
    
    Write-Host "Selected month is " -NoNewline; Write-Host (GetFullMonthName $month) -ForegroundColor Green
    
    return [int]$selectedMonth
}