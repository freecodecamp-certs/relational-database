#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -c"
echo -e "\n~~ Welcome ~~\n"
echo -e "\nHow may I help you?"
MAIN_MENU(){
#	if [[ $1 ]]
#	then
#		echo -e "\n$1"
#	fi
	echo "$($PSQL "SELECT * FROM services")" | while read SVCID BAR NME
do
	if [[ $SVCID =~ ^[0-9]+ ]]
	then
		echo "$SVCID) $NME"
	fi
done

	read SERVICE_ID_SELECTED

	if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
	then
		MAIN_MENU "Please type a digit to select a service"
	else
		SERVICE_NAME=$(echo "$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")" | sed -n 3p | sed -r 's/^ *| *$//g')
		echo $SERVICE_NAME
		if [[  $( echo $SERVICE_NAME | grep "(0 rows)") ]]
		then

			MAIN_MENU "Please select a number from the list"
		else
			REQUEST_SERVICE $(echo "$SERVICE_NAME" | sed -n 3p | sed -r 's/^ *| *$//g') $SERVICE_ID_SELECTED
		fi
	fi

}
REQUEST_SERVICE(){
	if [[ -z $CUSTOMER_PHONE ]]
	then
		echo -e "\nPlease provide your phone number"
		while [[ ! $CUSTOMER_PHONE =~ [0-9]+[-]{,1}[0-9]+ ]]
		do
			echo "Please use digits, optionally separated with \"-\""
			read CUSTOMER_PHONE
		done
	fi
	if [[ -z $CUSTOMER_ID ]]
	then
		CHECK_CUSTOMER
	else
		while [[ ! $SERVICE_TIME ]]
		do
			echo -e "\nPlease request a time"
			read SERVICE_TIME
		done
		echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
		INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
	fi
}
CHECK_CUSTOMER(){
	CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
	if [[ $(echo "$CUSTOMER_NAME" | grep "(0 rows)") ]]
	then
		NEW_CUSTOMER
	else
		CUSTOMER_NAME=$(echo "$CUSTOMER_NAME" | sed -n 3p | sed -r 's/^ *| *$//g')
		CUSTOMER_ID=$(echo "$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")" | sed -n 3p | sed -r 's/^ *| *$//g')
		echo "CustomerID: $CUSTOMER_ID, customerName: $CUSTOMER_NAME"
		REQUEST_SERVICE
	fi
}
NEW_CUSTOMER(){
	echo -e "\nWhat is your name?"
	while [[ ! $CUSTOMER_NAME =~ ^[A-Z|a-z]\ {,1}[A-Z|a-z]*$ ]]
	do
		echo "Please enter alphabetical characters with no spaces"
		read CUSTOMER_NAME
	done
	echo -e "\nIt's nice to meet you, $CUSTOMER_NAME.\nPlease provide some additional details so we can record your bookings properly.\nThese will be saved on our system for next time"
	INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")


	#REQUEST_SERVICE
	CHECK_CUSTOMER
}

MAIN_MENU
