function GetXlsxPath{
    if($env:computername -eq "PC_JFLUCKIGER"){
        return "C:\Users\jfluckiger\OneDrive\Budget\2024Budget.xlsx"
    }else{
        return "C:\Users\james\OneDrive\Budget\2024Budget.xlsx"
    }
}