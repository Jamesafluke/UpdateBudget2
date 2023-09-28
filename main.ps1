
# . "C:\PersonalMyCode\PowerShellScratch\addition.ps1"  



. "$PSScriptRoot\Modules\SelectMonth.ps1"
# . "C:\PersonalMyCode\UpdateBudget2\Modules\SelectMonth.ps1"


$outputPath = "C:\PersonalMyCode\UpdateBudget\output.csv"

Write-Host "Welcome to Budginator!" -ForegroundColor Green

# StartAhk

$month = SelectMonth
Write-Host $month
# $year = SelectYear

# $accountHistoryPaths = SetAccountHistoryPaths

# $accountHistory = ImportAccountHistory $year $month $accountHistoryPaths

# $existingBudget = ImportExistingBudget $month

# BackupBudget

# $verifiedExpenses = Deduplicate $accountHistory $existingBudget

# ExportExpenses $verifiedExpenses $outputPath

# DeleteAccountHistoryFiles $accountHistoryPaths

# OpenOutput $outputPath