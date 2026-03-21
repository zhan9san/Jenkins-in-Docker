FROM jenkins/jenkins:2.479.3-lts
ARG JPM_VERSION=v0.1.2
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc.yaml

USER root

COPY --chown=jenkins:jenkins src/executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

RUN case "$(uname -m)" in \
      x86_64) JPM_ARCH="x86_64" ;; \
      aarch64|arm64) JPM_ARCH="aarch64" ;; \
      *) echo "Unsupported architecture: $(uname -m)" && exit 1 ;; \
    esac \
 && JPM_FILE="jpm-${JPM_VERSION}-${JPM_ARCH}-unknown-linux-gnu.tar.gz" \
 && curl -fsSL -o "/tmp/${JPM_FILE}" "https://github.com/zhan9san/jpm/releases/download/${JPM_VERSION}/${JPM_FILE}" \
 && curl -fsSL -o "/tmp/${JPM_FILE}.sha256" "https://github.com/zhan9san/jpm/releases/download/${JPM_VERSION}/${JPM_FILE}.sha256" \
 && cd /tmp \
 && sha256sum -c "${JPM_FILE}.sha256" \
 && tar -xzf "${JPM_FILE}" \
 && install -m 0755 jpm /usr/local/bin/jpm \
 && rm -f "${JPM_FILE}" "${JPM_FILE}.sha256" jpm

USER jenkins
COPY --chown=jenkins:jenkins src/plugins-lock.txt /usr/share/jenkins/ref/plugins-lock.txt
RUN jpm install -l /usr/share/jenkins/ref/plugins-lock.txt -d /usr/share/jenkins/ref/plugins/

COPY --chown=jenkins:jenkins src/seedjob.groovy /var/jenkins_home/seedjob.groovy
