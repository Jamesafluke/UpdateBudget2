function LogMessage(){
    param(
        [string]$source,
        [string]$message
    )
    $logDate = (Get-Date).tostring("yyyMMdd")
    $logFile = $PSScriptRoot+ "\logs\" + $logDate + ".txt"
    $timeStamp = (Get-Date).toString("dd/MM/yyy HH:mm:ss tt")
    $line = "$timeStamp - $source - $message"
    Write-Host $line
    Add-content -Path $logFile -Value $line
}