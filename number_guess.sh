#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
RAND_NUM=$(($RANDOM % 1000 + 1)) 


NUMBER_GUESSING() {
  echo -e "Enter your username:"
  echo -e "\nThe random number is $RAND_NUM"
}

NUMBER_GUESSING