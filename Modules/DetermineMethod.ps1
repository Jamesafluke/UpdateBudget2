function DetermineMethod {
    param (
        $verifiedExpenses
    )
    foreach($entry in $verifiedExpenses){

        #Determine method.
        if ($entry.method -eq "313235393200"){
            $entry.method = "Rewards"
        }elseif ($entry.method -eq "750501095729") {
            $entry.method = "Checking"
        }
    }

    return $verifiedExpenses
}