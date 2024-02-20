. "$PSScriptRoot\GetFullMonthName.ps1"

function SelectMonth{
    $userInput = Read-Host "Use current month? y/n"
    if($userInput -eq 'y'){
        $selectedMonth = Get-Date -Format "MM"
    }else{
        $selectedMonth = Read-Host "Enter a number between 1 and 12 for the desired month"
    }
    
    LogMessage $MyInvocation.MyCommand.Name "Selected month is " -NoNewline; LogMessage $MyInvocation.MyCommand.Name (GetFullMonthName $month) -ForegroundColor Green
    
    return [int]$selectedMonth
}