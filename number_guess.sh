#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RAND_NUM=$(($RANDOM % 1000 + 1)) 


NUMBER_GUESSING() {
  echo -e "Enter your username:"
  read USERNAME
  USERNAME_RESULT=$($PSQL "SELECT user_id FROM users WHERE username ='$USERNAME'")

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

  
}

NUMBER_GUESSING