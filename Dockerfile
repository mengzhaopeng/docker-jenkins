FROM jenkins/jenkins:2.138.2-alpine

MAINTAINER mengzhaopeng <qiuranke@gmail.com>

# Install plugins
RUN /usr/local/bin/install-plugins.sh \
  git \
  kubernetes \
  ldap \
  matrix-auth \
  pipeline-build-step \
  pipeline-graph-analysis \
  pipeline-input-step \
  pipeline-milestone-step \
  pipeline-model-api \
  pipeline-model-declarative-agent \
  pipeline-model-definition \
  pipeline-model-extensions \
  pipeline-rest-api \
  pipeline-stage-step \
  pipeline-stage-tags-metadata \
  pipeline-stage-view

# Add groovy setup config
COPY init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/

# Generate jenkins ssh key.
COPY generate_key.sh /usr/local/bin/generate_key.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
