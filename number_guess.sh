#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RAND_NUM=$(($RANDOM % 1000 + 1)) 
NUM=0


ASK_FOR_NUM() {
  if [[ -z $1 ]]
  then
    echo "Guess the secret number between 1 and 1000:"
  else
    echo $1
  fi
  read NUM
  if [[ ! $NUM =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    ASK_FOR_NUM
  elif [[ -z $NUM ]]
  then
    echo "That is not an integer, guess again:"
    ASK_FOR_NUM
  fi
}

NUMBER_GUESSING() {
  echo -e "Enter your username:"
  read USERNAME
  USERNAME_RESULT=$($PSQL "SELECT user_id FROM users WHERE username ='$USERNAME'")
  NUM_OF_GUESSES=0

  #check if username already exists
  if [[ -z $USERNAME_RESULT ]]
  then
    #insert user into database
    INSERTION_RESULT=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$USERNAME', 0, 0)")
    #greet new user appropriately
    echo "Welcome, $USERNAME! It looks like this is your first time here."

  else
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
    USERNAME=$($PSQL "SELECT username FROM users WHERE user_id = $USER_ID")
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
    #greet the user back appropriately
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  #Run first time before starting the loop
  ASK_FOR_NUM 

  while [[ $NUM -ne $RAND_NUM ]]
  do
    ASK_FOR_NUM


  done
}

NUMBER_GUESSING