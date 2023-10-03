Write-Host "DetermineMethodUnitTest goes here!"

function Main{
    . $PSScriptRoot\..\Modules\DetermineMethod.ps1

    #Add unit test data!

    $verifiedExpenses = DetermineMethod $verifiedExpenses


    if(!(TestRewardMethod $verifiedExpenses)){
        Write-Host "TestRewardMethod failed." -ForegroundColor Red
    }else{
    Write-Host "TestRewardMethod succeeded" -ForegroundColor Green
    }
    if(!(TestCheckingMethod $verifiedExpenses)){
        Write-Host "TestCheckingMethod failed." -ForegroundColor Red
    }else{
        Write-Host "TestCheckingMethod succeeded" -ForegroundColor Green
    }
}


function TestRewardMethod{
    param(
        $verifiedExpenses
    )
    $rewardCount = 0
    foreach($item in $verifiedExpenses){
        if($item.method -eq "Rewards"){
            $rewardCount ++
        }
    }
    if($rewardCount -eq 3){
        return $true
    }else{
        return $false
    }
}

function TestCheckingMethod{
    param(
        $verifiedExpenses
    )
    $checkingCount = 0
    foreach($item in $verifiedExpenses){
        if($item.method -eq "Checking"){
            $checkingCount ++
        }
    }
    if($checkingCount -eq 2){
        return $true
    }else{
        return $false
    }
}

Main