function CheckExistingAccountHistory{
    param(
        $accountHistoryPaths
    )

    $file0Exists = ""
    $file1Exists = ""
    #Check for existing files
    if(Test-Path $accountHistoryPaths[0] -PathType Leaf){
        $file0Exists = $true
    }
    if(Test-Path $accountHistoryPaths[1] -PathType Leaf){
        $file1Exists = $true
    }

    if($file0Exists -and $file1Exists){
        $userInput = Read-Host "Found two existing account history files. Delete them? y/n"
        if($userInput = 'y'){
            LogMessage $MyInvocation.MyCommand.Name "Deleting $accountHistoryPaths[0] and $accountHistoryPaths[1]"
            Remove-ItemSafely $accountHistoryPaths[0]
            Remove-ItemSafely $accountHistoryPaths[1]
        }
    }elseif($file0Exists){
        $userInput = Read-Host "Found one existing account history file. Delete it? y/n"
        if($userInput = 'y'){
            LogMessage $MyInvocation.MyCommand.Name "Deleting $accountHistoryPaths[0]"
            Remove-ItemSafely $accountHistoryPaths[0]
        }        
    }elseif($file1Exists){
        $userInput = Read-Host "Found one existing account history file. Delete it? y/n"
        if($userInput = 'y'){
            LogMessage $MyInvocation.MyCommand.Name "Deleting $accountHistoryPaths[1]"
            Remove-ItemSafely $accountHistoryPaths[1]
        }        
    }
}
