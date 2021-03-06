#### Launch Jenkins

Launch Jenkins as a Docker Container with the following command:

`docker run -d -u root --name jenkins \
    -p 8080:8080 -p 50000:50000 \
    -v /root/jenkins:/var/jenkins_home \
    jenkins:1.651.1-alpine`{{execute}}

All plugins and configurations get persisted to the host (`ssh root@host01`) at _/root/jenkins_. Port 8080 opens the web dashboard, 50000 is used to communicate with other Jenkins agents. Finally, the image has an alpine base to reduce the size footprint.

#### Load Dashboard

You can load the Jenkins' dashboard via the following URL https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

The username is `admin`{{copy}} with the password the default `344827fbdbfb40d5aac067c7a07b9230`{{copy}}

On your own system, the password can befound via `docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword`{{execute}}

It may take a couple of seconds for Jenkins to finish starting and be available. In next steps, you'll use the dashboard to configure the plugins and start building Docker Images.

