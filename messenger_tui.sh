#!/bin/bash

# Function to send message to friend or group
send_message() {
	python send_message.py "$1" "$2"
}

# Dialog menu to select recipient type
recipient_type=$(dialog --clear \
	--backtitle "Messenger TUI" \
	--title "Select Recipient Type" \
	--menu "Choose the recipient type:" \
	15 40 2 \
	"Friend" "Send message to a friend" \
	"Group" "Send message to a group" \
	3>&1 1>&2 2>&3)

# Check if the user canceled
if [ $? -ne 0 ]; then
	echo "Operation canceled."
	exit 1
fi

# Dialog prompt to enter recipient's ID
recipient_id=$(dialog --clear \
	--backtitle "Messenger TUI" \
	--title "Enter Recipient ID" \
	--inputbox "Enter the recipient's ID:" \
	10 40 \
	3>&1 1>&2 2>&3)

# Check if the user canceled
if [ $? -ne 0 ]; then
	echo "Operation canceled."
	exit 1
fi

# Dialog prompt to enter message
message=$(dialog --clear \
	--backtitle "Messenger TUI" \
	--title "Enter Message" \
	--inputbox "Enter the message:" \
	10 40 \
	3>&1 1>&2 2>&3)

# Check if the user canceled
if [ $? -ne 0 ]; then
	echo "Operation canceled."
	exit 1
fi

# Send the message based on the recipient type
case $recipient_type in
Friend)
	send_message "$recipient_id" "$message"
	;;
Group)
	send_message "$recipient_id" "$message"
	;;
*)
	echo "Invalid option selected."
	exit 1
	;;
esac

echo "Message sent successfully."
