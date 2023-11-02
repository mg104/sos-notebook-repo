#!/bin/bash

# Giving default value of initial wait time
DEFAULT_WAIT_TIME=900

if [ "$#" -lt 1 ]; then
	echo "Usage: $0 CONTAINER_NAME [WAIT_TIME]"
	exit 1
fi


# Get the docker container's name from BASHRC file. Declare it in .bashrc file for purposes of being used at startup
CONTAINER_NAME="${1}"

# Initial wait time to suspend this checking, to prevent immediate shutdown after container starts
WAIT_TIME="${2:-$DEFAULT_WAIT_TIME}"

# Get the Jupyter Token from the running container
JUPYTER_TOKEN=$(docker exec ${CONTAINER_NAME} printenv JUPYTER_TOKEN)

# Create the jupyterlab api-session URL string
API_SESSION="localhost:8888/api/sessions?token=${JUPYTER_TOKEN}"

# Wait for the first 15 minutes after starting the container to prevent immediate shutdown after starting the container
sleep ${WAIT_TIME}

# Check every n seconds
CHECK_INTERVAL=10

# Create a while loop to check every n seconds if there is no kernel running
while true; do
	RESPONSE=$(docker exec ${CONTAINER_NAME} curl -s "${API_SESSION}")
	if [ "${RESPONSE}" == "[]" ]; then
		echo "Jupyterlab curl API returned an empty array. Shutting down..."
		shutdown now
	else 
		echo "Array: ${RESPONSE} ---- Not shutting down"
	fi 
	sleep ${CHECK_INTERVAL}
done
