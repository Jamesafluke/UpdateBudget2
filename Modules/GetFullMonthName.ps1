

function GetFullMonthName{
    param(
        $month
    )
    $fullMonths=@("January","February","March","April","May","June","July","August","September","October","November","December")
    return $fullMonths[$month -1]
}