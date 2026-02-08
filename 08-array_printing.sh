#!/bin/bash

# normal variables
number=100
string=Rajesh

sum=$(($number + $string))
echo "$sum"

# array

bike_companies=("Hero" "Honda" "Bajaj" "Royal Enfield" "Yamaha" "TVS")

echo "Budget frinedly bikes are: ${bike_companies[0]}, ${bike_companies[1]}"
echo "Stylish and sports bike are from : ${bike_companies[4]},${bike_companies[5]}"
echo "Best mileage bikes are from the ${bike_companies[2]}"
echo "Best Retro style bikes are manfactured by ${bike_companies[3]}"

