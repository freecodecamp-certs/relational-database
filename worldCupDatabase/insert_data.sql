#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams,games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
	if [[ $YEAR != year ]]
	then # insert distinct teams
		TEAM_ID_Q_STR="SELECT team_id FROM teams WHERE name="
		# get teams.team_id of winner

		WINNER_ID=$($PSQL "$TEAM_ID_Q_STR'$WINNER'")
		# if not exist, insert
		if [[ -z $WINNER_ID ]]
		then
			INSERT_WINNER_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
			# and get new
			WINNER_ID=$($PSQL "$TEAM_ID_Q_STR'$WINNER'")
		fi
		# get teams.team_id of opponent
		OPPONENT_ID=$($PSQL "$TEAM_ID_Q_STR'$OPPONENT'")
		#if opp_id not exist insert
		if [[ -z $OPPONENT_ID ]]
		then
			INSERT_OPPONENT_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
			# and get new
			OPPONENT_ID=$($PSQL "$TEAM_ID_Q_STR'$OPPONENT'")
		fi
		# get game_id
		GAME_ID=$($PSQL "SELECT game_id FROM games WHERE winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID' AND round='$ROUND' AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS AND year=$YEAR")
		# if game_id not exist insert
		if [[ -z $GAME_ID ]]
		then
		INSERT_GAME_ID=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND','$WINNER_ID','$OPPONENT_ID',$WINNER_GOALS,$OPPONENT_GOALS)")
		fi
	fi
done
