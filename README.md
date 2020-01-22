# jenkins-project
Project repo for Docker image validation and publishing

STEPS:

1. On your docker host, clone git repository:    https://github.com/supreetraut/jenkins-project.git

2. Go inside downloaded repository folder and run:    docker-compose up -d

3. Get the jenkin's container ID using command:   docker ps

4. And log into the container using command:    docker exec -u 0 -ti <container_id> bash

5. Run following 2 commands inside the jenkins container:

       chown jenkins:jenkins /usr/bin/docker
       chown jenkins:jenkins /var/run/docker.sock
       cat /var/jenkins_home/secrets/initialAdminPassword

6. Copy the initialAdminPassword from above command and perform initial jenkins configuration through UI. 
   Note: Please select 'Continue as Admin' on the credentials page, as any user created at this step will be removed in step 9.
         Use the initial admin password from step 5, if asked to relogin at this point.

7. Once the jenkins is setup and running, go to 'Manage Jenkins' -> 'Configuration as Code'

8. Inside Configuration as code, in the 'Replace configuration source with: Path or URL' text box, enter: "/usr/share/jenkins/config_jenkins.yaml"

9. After entering the file path in the text box, click on 'Apply new configuration' button. This will setup the role strategies and the jenkins pipeline job to build and publish your Jenkins image with role strategy configuration. 

10. The jenkins setup is now complete. Build the 'Jenkins_Role_Strategy' job now and check the latest version of the image in your local docker repository using command:   docker images

