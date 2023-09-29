function BackupBudget(){
    $backupPath = "C:\PersonalMyCode\UpdateBudget\BudgetBackup\"
    $destination = $backupPath + (Get-Date -Format "MM-dd-yyyy-hh-mm")
    $path = GetXlsxPath
    Copy-Item $path -Destination $destination 
}