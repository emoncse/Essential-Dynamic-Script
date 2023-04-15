#install docker
docker pull jenkins/jenkins

# Install docker
docker run jenkins/jenkins

#Password
05366c959d92487688c22f25b0810354


# Expose port (localPort:dockerPort)
docker run -d -p 8080:8080 jenkins/jenkins
# -d [ demon mode -> run background ]
# -p [Port forwording]