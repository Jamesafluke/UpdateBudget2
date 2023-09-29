function ImportAccountHistory{
    param(
        $year,
        $month,
        $accountHistoryPaths
    )
    $accountHistory0 = Import-Csv $accountHistoryPaths[0]
    $accountHistory1 = Import-Csv $accountHistoryPaths[1]
    $combinedCsv = $accountHistory0 + $accountHistory1
    Write-Host "$($accountHistory0.Count) items in accountHistory0"
    Write-Host "$($accountHistory1.Count) items in accountHistory1"
    Write-Host "$($combinedCsv.Count) total items in account history."
    
    # Filter account history data by selected month and specific condition
    $filteredAccountHistory = $combinedCsv | Where-Object {
        $entry = $_
        if($entry.Status -eq "Pending"){
            Write-Host "Found a pending $entry"
            $pendingItems += $entry
        }else{

            $postDate = Get-Date $entry."Post Date"
            
            # Check if the year and month match
            if ([int]$postDate.Year -ne $year) {
                return $false
            }   
            if ([int]$postDate.Month -ne $month){
                return $false
            }
            return $true
        }
    }
    Write-Host "After trimming extraneous months and years there are " -NoNewLine; Write-Host $filteredAccountHistory.Count -NoNewLine -ForegroundColor Green; Write-Host " account history items in " -NoNewLine; Write-Host (GetFullMonthName $month) $year -NoNewLine -ForegroundColor Green; Write-Host "."
    return $filteredAccountHistory
}