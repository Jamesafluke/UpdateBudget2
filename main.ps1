# . "$PSScriptRoot\Modules\*.ps1" #Doesn't work.
. "$PSScriptRoot\Modules\StartAhk.ps1"
. "$PSScriptRoot\Modules\SelectMonth.ps1"
. "$PSScriptRoot\Modules\SelectYear.ps1"
. "$PSScriptRoot\Modules\SetAccountHistoryPaths.ps1"
. "$PSScriptRoot\Modules\ImportAccountHistory.ps1"
. "$PSScriptRoot\Modules\ImportExistingBudget.ps1"
. "$PSScriptRoot\Modules\BackupBudget.ps1"
. "$PSScriptRoot\Modules\Deduplicate.ps1"
. "$PSScriptRoot\Modules\ArbitraryExceptions.ps1"
. "$PSScriptRoot\Modules\ExportExpenses.ps1"
. "$PSScriptRoot\Modules\DeleteAccountHistoryFiles.ps1"
. "$PSScriptRoot\Modules\OpenOutput.ps1"


$outputPath = "C:\PersonalMyCode\UpdateBudget\output.csv"

Write-Host "Welcome to Budginator!" -ForegroundColor Green

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