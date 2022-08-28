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

  while [[ $NUM -ne $RAND_NUM ]]
  do
    ASK_FOR_NUM
    NUM_OF_GUESSES=$(($NUM_OF_GUESSES + 1))
    if  [[ $NUM > $RAND_NUM ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $NUM < $RAND_NUM ]]
    then
      echo "It's higher than that, guess again:"
    fi
  done

  #Once the while loop breaks number has been guessed:
  echo "You guessed it in $NUM_OF_GUESSES tries. The secret number was $RAND_NUM. Nice job!"
  #Now we need to update the database for this user:
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")
  GET_BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  if [[ $GET_BEST_GAME -eq 0 ]]
  then
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUM_OF_GUESSES WHERE username = '$USERNAME'")
  elif [[ $GET_BEST_GAME > $NUM_OF_GUESSES ]]
  then
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUM_OF_GUESSES WHERE username = '$USERNAME'")
  fi

}

NUMBER_GUESSING