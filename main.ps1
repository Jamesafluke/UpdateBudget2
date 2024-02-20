# . "$PSScriptRoot\Modules\*.ps1" #Doesn't work.
. "$PSScriptRoot\Modules\LogMessage.ps1"
. "$PSScriptRoot\Modules\SetAccountHistoryPaths.ps1"
# . "$PSScriptRoot\Modules\CheckExistingAccountHistory.ps1"
. "$PSScriptRoot\Modules\StartAhk.ps1"
. "$PSScriptRoot\Modules\SelectMonth.ps1"
. "$PSScriptRoot\Modules\SelectYear.ps1"
. "$PSScriptRoot\Modules\ImportAccountHistory.ps1"
. "$PSScriptRoot\Modules\ImportExistingBudget.ps1"
. "$PSScriptRoot\Modules\BackupBudget.ps1"
. "$PSScriptRoot\Modules\Deduplicate.ps1"
. "$PSScriptRoot\Modules\DetermineMethod.ps1"
. "$PSScriptRoot\Modules\ArbitraryExceptionsModify.ps1"
. "$PSScriptRoot\Modules\ArbitraryExceptionsRemove.ps1"
. "$PSScriptRoot\Modules\ExportExpenses.ps1"
. "$PSScriptRoot\Modules\DeleteAccountHistoryFiles.ps1"
. "$PSScriptRoot\Modules\OpenOutput.ps1"
. "$PSScriptRoot\Modules\OpenXlsx.ps1"


$outputPath = "$PSScriptRoot\output.csv"

function Main {

    LogMessage $MyInvocation.MyCommand.Name "Welcome to Budginator!" -ForegroundColor Green
    LogMessage $MyInvocation.MyCommand.Name "Backlog: Write a function that imports the data directly into the budget instead of to output.csv"
    LogMessage $MyInvocation.MyCommand.Name "Backlog: Include an auto LastUpdated field on the budget."
    LogMessage $MyInvocation.MyCommand.Name "Backlog: Make it laptop/desktop (screen resolution) agnostic. It already is, but the residual code should be removed. But wait, maybe it's not that simple. As long as I'm using OneDrive this will be necessary?"

    $accountHistoryPaths = SetAccountHistoryPaths

    # CheckExistingAccountHistory $accountHistoryPaths

    StartAhk

    $month = SelectMonth
    Write-Host $month
    $year = SelectYear
    Write-Host $year


    $accountHistory = ImportAccountHistory $year $month $accountHistoryPaths

    $existingBudget = ImportExistingBudget $month

    BackupBudget

    $verifiedExpenses = Deduplicate $accountHistory $existingBudget

    $verifiedExpenses = DetermineMethod $verifiedExpenses

    $verifiedExpenses = ArbitraryExceptionsModify $verifiedExpenses

    $verifiedExpenses = ArbitraryExceptionsRemove $verifiedExpenses

    ExportExpenses $verifiedExpenses $outputPath

    DeleteAccountHistoryFiles $accountHistoryPaths

    OpenOutput $outputPath

    OpenXlsx $(GetXlsxPath)

}


Main