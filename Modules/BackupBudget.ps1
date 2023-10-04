function BackupBudget(){
    $backupPath = "$PSScriptRoot\..\BudgetBackup\"
    $destination = $backupPath + (Get-Date -Format "MM-dd-yyyy-hh-mm")
    $path = GetXlsxPath
    Copy-Item $path -Destination $destination 
}