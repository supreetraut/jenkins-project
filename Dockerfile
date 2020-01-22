FROM jenkins/jenkins
USER root
RUN apt-get update && apt-get install -y --no-install-recommends curl git
RUN curl -fsSL https://goss.rocks/install | sh
COPY goss.yaml /usr/share/jenkins/goss.yaml
COPY jenkins.yaml /usr/share/jenkins/config_jenkins.yaml
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
USER jenkins
EXPOSE 8080 50000
