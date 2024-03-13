. "$PSScriptRoot\GetFullMonthName.ps1"

function SelectMonth{
    $testMode = $false
    if($testMode){
        LogMessage $MyInvocation.MyCommand.Name "TESTMODE ON"
        $userInput = "y"
    }else{ #Test mode is off.
        $userInput = Read-Host "Use current month? y/n"
    }
    if($userInput -eq 'y'){
        $selectedMonth = Get-Date -Format "MM"
    }else{
        $selectedMonth = Read-Host "Enter a number between 1 and 12 for the desired month"
    }

    #2/20/2024: Haven't tested this LogMessage:
    LogMessage $MyInvocation.MyCommand.Name "Selected month is $(GetFullMonthName $month)"
    
    return [int]$selectedMonth
}