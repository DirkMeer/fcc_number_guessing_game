#!/bin/bash

RAND_NUM=$(($RANDOM % 1000 + 1)) 

echo $RAND_NUM

NUM=500

if  [[ "$NUM" -gt "$RAND_NUM" ]]
then
  echo "It's lower than 500, guess again:"
elif [[ "$NUM" -lt "$RAND_NUM" ]]
then
  echo "It's higher than 500, guess again:"
fi




# RANDTWO=$(( ( RANDOM % 1000 )  + 1 ))

# echo $RANDTWO

