#!/bin/bash
if [[ ! $1 ]]
then
	echo "Please provide an element as an argument."
else
	PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
	# try to use argument to obtain atomic_number
	if [[ ! $1 =~ ^[0-9]+$ ]]
	then
		ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements
		WHERE symbol ILIKE '$1' OR name ILIKE '$1'")
	else
		ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements
		WHERE atomic_number=$1")
	fi
	# reject if not found
	if [[ ! $ATOMIC_NUMBER =~ ^[0-9]+$ ]]
	then
		echo "I could not find that element in the database."
	else
	# assign variables from elements table if found
		echo "$($PSQL "SELECT * FROM elements
		WHERE atomic_number=$ATOMIC_NUMBER")" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
	do
		echo "$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, p.type_id, type
		FROM properties p INNER JOIN types USING(type_id)
		WHERE atomic_number=$ATOMIC_NUMBER")" | while IFS="|" read MASS MELTING BOILING TYPE_ID TYPE
	do
	# Output variables with context
		echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
	done
done
	fi
fi
