


function Main{

    Write-Host "Inside ArbitraryExceptionsUnitTest.ps1 now!"

    Import-Module $PSScriptRoot\..\Modules\ArbitraryExceptionsModify.ps1

    $verifiedExpenses = Import-Csv $PSScriptRoot/UnitTests/ArbitraryExceptions/verifiedExpenses.csv

    $verifiedExpenses = ArbitraryExceptions $verifiedExpenses

    if(!(TestArbitraryExceptionAmericanFunds $verifiedExpenses)){
        Write-Host "TestArbitraryExceptionAmericanFunds failed." -ForegroundColor Red
    }else{
        Write-Host "TestArbitraryExceptionAmericanFunds succeeded" -ForegroundColor Green
    }
    
    if(!(TestArbitraryExceptionHOA $verifiedExpenses)){
        Write-Host "TestArbitraryExceptionHOA failed." -ForegroundColor Red
    }else{
        Write-Host "TestArbitraryExceptionHOA succeeded" -ForegroundColor Green
    }
    
    if(!(TestArbitraryExceptionWalmart $verifiedExpenses)){
        Write-Host "TestArbitraryExceptionWalmart failed." -ForegroundColor Red
    }else{
        Write-Host "TestArbitraryExceptionWalmart succeeded" -ForegroundColor Green
    }
}



# Check if it returns arbitrary exceptions correctly.
function TestArbitraryExceptionAmericanFunds {
    param (
        $verifiedExpenses
    )
    foreach($item in $verifiedExpenses){
        if($item.Item -eq "American Funds" -and $item.Description -eq "This will become millions" -and $item.category -eq "Investment"){
            return $true
        }
    }
}
function TestArbitraryExceptionHOA {
    param (
        $verifiedExpenses
    )
    foreach($item in $verifiedExpenses){
        if($item.Item -eq "HOA" -and $item.category -eq "HOA"){
            return $true
        }
    }
}
function TestArbitraryExceptionWalmart {
    param (
        $verifiedExpenses
    )
    $numberOfWalmart = 0
    foreach($item in $verifiedExpenses){
        if($item.Item -eq "Walmart" -and $item.category -eq "Groceries"){
            $numberOfWalmart ++
        }
    }
    if($numberOfWalmart -eq 2){
        return $true
    }
    return $false
}

Main