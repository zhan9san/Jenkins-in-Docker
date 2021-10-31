FROM jenkins/jenkins:2.289.2-lts
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

COPY --chown=jenkins:jenkins src/executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

COPY --chown=jenkins:jenkins src/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

COPY --chown=jenkins:jenkins src/seedjob.groovy /var/jenkins_home/seedjob.groovy
