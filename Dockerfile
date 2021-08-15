FROM docker.elastic.co/logstash/logstash:7.13.4

LABEL Maintainer="Mehmet Yazicioglu"

USER root

RUN yum update -y \
    && yum clean all
    
USER logstash
