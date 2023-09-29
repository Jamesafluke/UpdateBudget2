function DeleteAccountHistoryFiles{
    param(
        $accountHistoryPaths
    )
    $userInput = Read-Host "Delete AccountHistory files? y/n"
    # $userInput = 'n'
    if($userInput -eq 'y'){
        Write-Host "Deleting $accountHistoryPaths[0] and $accountHistoryPaths[1]"
        Remove-ItemSafely $accountHistoryPaths[0]
        Remove-ItemSafely $accountHistoryPaths[1]
    }
}
