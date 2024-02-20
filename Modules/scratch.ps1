
$xlsxPath = "C:\Users\jfluckiger\OneDrive\Budget\2024Budget.xlsx"
$abbMonthName = "Jan"


$rawXlsxData = Import-Excel $xlsxPath -WorksheetName $abbMonthName -NoHeader -ImportColumns @(19,20,21,22,23,24) -startrow 8 -endrow 200

LogMessage $MyInvocation.MyCommand.Name $rawXlsxData