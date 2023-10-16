# . "$PSScriptRoot\Modules\*.ps1" #Doesn't work.
. "$PSScriptRoot\Modules\StartAhk.ps1"
. "$PSScriptRoot\Modules\SelectMonth.ps1"
. "$PSScriptRoot\Modules\SelectYear.ps1"
. "$PSScriptRoot\Modules\SetAccountHistoryPaths.ps1"
. "$PSScriptRoot\Modules\ImportAccountHistory.ps1"
. "$PSScriptRoot\Modules\ImportExistingBudget.ps1"
. "$PSScriptRoot\Modules\BackupBudget.ps1"
. "$PSScriptRoot\Modules\Deduplicate.ps1"
. "$PSScriptRoot\Modules\DetermineMethod.ps1"
. "$PSScriptRoot\Modules\ArbitraryExceptions.ps1"
. "$PSScriptRoot\Modules\ExportExpenses.ps1"
. "$PSScriptRoot\Modules\DeleteAccountHistoryFiles.ps1"
. "$PSScriptRoot\Modules\OpenOutput.ps1"


$outputPath = "$PSScriptRoot\output.csv"

Write-Host "Welcome to Budginator!" -ForegroundColor Green
Write-host "Write a function that checks if account history is already sitting in the downloads folder and deleted if needed."
Write-Host "Write a function that deletes the unneeded categories such as the paycheck or credit card payments."

StartAhk

$month = SelectMonth
Write-Host $month
$year = SelectYear
Write-Host $year

$accountHistoryPaths = SetAccountHistoryPaths

$accountHistory = ImportAccountHistory $year $month $accountHistoryPaths

$existingBudget = ImportExistingBudget $month

BackupBudget

$verifiedExpenses = Deduplicate $accountHistory $existingBudget

$verifiedExpenses = DetermineMethod $verifiedExpenses

$verifiedExpenses = ArbitraryExceptions $verifiedExpenses

ExportExpenses $verifiedExpenses $outputPath

DeleteAccountHistoryFiles $accountHistoryPaths

OpenOutput $outputPath