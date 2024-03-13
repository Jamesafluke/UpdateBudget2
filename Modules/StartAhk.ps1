function StartAhk{
    $testMode = $false #Testmode skips the question to download new account history. Assumes they are already downloaded.
    
    #Check for existing files.
    $path0 = ""
    $path1 = ""
    if($env:computername -eq "PC_JFLUCKIGER"){
        $path0 = "C:\users\jfluckiger\Downloads\AccountHistory.csv"
        $path1 = "C:\users\jfluckiger\Downloads\AccountHistory(1).csv"
    }else{
        $path0 = "C:\users\james\Downloads\AccountHistory.csv"
        $path1 = "C:\users\james\Downloads\AccountHistory(1).csv"
    }
    
    if((Test-Path $path0 -PathType Leaf) -and (Test-Path $path1 -PathType Leaf)){
        #Both files exist
        
    }elseif(Test-Path $path0 -PathType Leaf){
        #file 0 exists
    }elseif(Test-Path $path1 -PathType Leaf){
        #file 1 exists
    }else{
        #Neither files exists.
    }
    

    if($testMode){

        LogMessage $MyInvocation.MyCommand.Name "StartAhk TESTMODE ON"
        $userInput = "n"
    }else{ #testMode off.
        $userInput = Read-Host "Download account history? y/n"
    }

    if($userInput -eq "y"){
        if($env:computername -eq "PC_JFLUCKIGER"){
            LogMessage $MyInvocation.MyCommand.Name "Laptop AHK"
            Invoke-Item "$PSScriptRoot\..\AHK\laptopDownloadUccu.ahk"
        }
        else{
            LogMessage $MyInvocation.MyCommand.Name "Desktop AHK"
            Invoke-Item "$PSScriptRoot\..\AHK\desktopDownloadUccu.ahk"
        }
    }
}