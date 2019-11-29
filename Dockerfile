FROM jenkins/jnlp-slave

USER root

RUN apt update

RUN apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common chromium

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN add-apt-repository \
   "deb http://apt.kubernetes.io/ \
   kubernetes-xenial \
   main"

RUN apt update

RUN apt install docker-ce kubectl -y

RUN usermod -aG docker jenkins

ENV CHROME_BIN /usr/bin/chromium

USER jenkins
