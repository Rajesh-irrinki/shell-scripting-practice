#!/bin/bash

# ----- variables -----------
number=100
string=Rajesh

# --------- arthematic operation ------------
sum=$(($number + $string)) # In linux string will count as "0", it won't throw an error unlike python
echo "Arthematic operation result: $sum"

# -------- concatenation ---------------

joined_string=${number}${string}
echo "concatenation result : $joined_string"

# --------- Arrays ----------------------

bike_companies=("Hero" "Honda" "Bajaj" "Royal Enfield" "Yamaha" "TVS")
echo "-----------------------------------------------------------------------"
echo "Budget frinedly bikes are: ${bike_companies[0]}, ${bike_companies[1]}"
echo "Stylish and sports bike are from : ${bike_companies[4]},${bike_companies[5]}"
echo "Best mileage bikes are from the ${bike_companies[2]}"
echo "Best Retro style bikes are manfactured by ${bike_companies[3]}"
echo "-----------------------------------------------------------------------"

