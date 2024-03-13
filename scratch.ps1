$xlsxOutputPath = "C:\PersonalMyCode\UpdateBudget2\testBudget.xlsx"
$verifiedExpenses = "asdf"

$data = @(
    @("Data1", "Data2", "Data3"),
    @(1, 2, 3),
    @("A", "B", "C")
)

$sheetName = "DummyFirstSheet"

$excelData = Import-Excel -Path $xlsxOutputPath -WorksheetName $sheetName -NoHeader

$newData = $existingData + $data

# $excelData | Add-Member -MemberType NoteProperty -Name "a1" -Value $verifiedExpenses -Force

# $excelData | Export-Excel -Path $xlsxOutputPath -WorksheetName $sheetName -AutoSize -NoHeader

Export-Excel -Path $xlsxOutputPath -WorksheetName $sheetName -AutoSize -Value $newData


Invoke-Item $xlsxOutputPath
