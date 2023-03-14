#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RAND_NUM=$(( $RANDOM % 1000 + 1 ))
echo "Enter your username:"
read USERNAME

EXIST_TEST=$($PSQL "SELECT name FROM users WHERE name='$USERNAME'")

if [[ -z $EXIST_TEST ]]
then
	STATUS='FALSE'
	ADD_USER=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
else
	STATUS='TRUE'
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE name='$USERNAME'")

	UPDATE_PLAYED=$($PSQL "UPDATE users SET games_played=$(( GAMES_PLAYED + 1 )) WHERE user_id=$USER_ID")
	if [[ $STATUS == 'FALSE' ]]
	then
		echo "Welcome, $USERNAME! It looks like this is your first time here."
	else
		echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
	fi

	echo "Guess the secret number between 1 and 1000:"
	read GUESS
	COUNT=1
	while [[ ! $GUESS == $RAND_NUM ]]
	do
		if [[ $GUESS =~ ^[0-9]+$ ]]
		then
			if [[ $GUESS -lt $RAND_NUM ]]
			then
				echo "It's higher than that, guess again:"
			else
				echo "It's lower than that, guess again:"
			fi
		else
			echo "That is not an integer, guess again:"
		fi
		read GUESS
		COUNT=$(( COUNT + 1 ))
	done

	if [[ $COUNT -lt $BEST_GAME || -z $BEST_GAME ]]
	then
		UPDATE_COMPLETED=$($PSQL "UPDATE users SET best_game=$COUNT WHERE user_id=$USER_ID")
	fi
	echo "You guessed it in $COUNT tries. The secret number was $RAND_NUM. Nice job!"
