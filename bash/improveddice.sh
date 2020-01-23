#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

# Tell the user we have started processing
echo "Rolling the 1st and 2nd dice..."
# roll the dice and save the results

die1=$(( RANDOM % 6 + 1 ))
die2=$(( RANDOM % 6 + 1 ))

echo "Rolled $die1 and $die2."
########################################
#Make range and bias variables, then generate a random result.
######################################
diesides=6
bias=1
result=$((RANDOM % diesides + bias))
echo "Rolling the 3rd die..."
echo "rolled $result."

###########################################
#Add the sum of the dice.
#########################################
sum=$(($die1 + $die2 + $result))
average=$(($sum /3))
echo "The sum of $die1, $die2, and $result is $sum, and the average is $average."