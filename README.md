# docker-django-autodeploy
Docker has Django and Gunicorn Server running and Intent is to launch the Django application with new instance every time.

# Problem: 
Needed some script/utility which will launch a unique instances of Docker Image. Here Docker Image will work as a sandbox/package in which Django Server, Gunicorn Server and Web Application is running. Gunicorn is used here for load balancing the production environment.

# Prerequisite:
Ubuntu 14.04 (Virtual Machine/ Virtual box/ Physical Machine)
Internet Connection within the Virtual Machine

# How to run?
Create a test directory inside your Ubuntu box => mkdir Demo
Copy demo.sh into the Demo Directory
Change permission of copied script => chmod +X demo.sh
Run shell script in sudo mode=> sudo ./demo.sh 

# What Script [demo.sh] is supposed to do?:
1. Install Docker in your machine, if it’s not already there.
2. Run Docker services and Docker-Engine, if not already running.
3. PULL the Required IMAGE from Docker-Hub, if it’s not available locally
4. RUN Docker Image and maintain the instances according to PORT
5. Auto run gunicorn server to manage production level workload
6. Provide you an [IP: PORT] to access the application  

# Enhancement to the current implementation:
•	To make it more operative, we can manage the Docker Container through script (example: stop/ shutdown/live status).   

•	We can integrate the Clean-Up mechanism for robustness


# NOTE:
Docker Image is available at https://hub.docker.com/ under Repository: sap1234
