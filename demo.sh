#!/bin/bash

#Define Global Variables
new_port=8880
file="./port_count"
repo="sap1234/docker-app4"

#Welcom Message
echo "Hello User"


#Check if docker is installed on System
docker -v 
if  [ $? != 0  ] 
then
	#If docker not installed then update linux packages
	echo "***********************************"
	echo -e "Docker is not install on your system\nPlease wait while updating the packages..."	
	echo "**********************************"
	apt-get update
	if [  $?  ]
	#Install docker engine; It will install the lastest version available 
	#I have tested on 17.3.0
	then apt-get install -y docker-engine
	else
	echo -e "Some problem in updating packages\nProbably internet connetion is weak"
	fi
else
echo "********************************"
echo "Docker is already installed.. nothing to do .."
fi

echo "***************************"
#PULL Image from DockerHUB
echo -e "Wait.. Pulling the Image from DockerHUB\n"
res=`docker images`
echo $res
res=`docker pull $repo`
echo $res
#Mainting counter of PORT NUMBER in a file
#If file exist then update the counter else create a file  
if [ -f "$file" ] 
then 
	echo -e "\n\nAnother Instance is going to invoke...\n\n"
	port=$(cat "$file")
	new_port=$((port+1))
	echo "$new_port" > "$file"  
else 
	echo -e "\n\nFirst Instance is going to invoke...\n\n" 
	echo $new_port > "$file"
fi
#Providing URL with new instance associated with PORT NUBMER
echo "************************"
echo -e "\n\n\nYour Instance is ready at \t http://localhost:$new_port\n"
echo -e "Open a new console or browser to acess the URL\n\n"
echo "#############################"

#RUN Command to launch the Conatiner
#Docker image has gunicorn seriver running with few workers; after RUN command auto run script will start Django and Gunicorn servers
res=`docker run -p $new_port:8000 $repo`
echo $res

