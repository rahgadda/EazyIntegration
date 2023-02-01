FROM openjdk:19-jdk-oraclelinux8
MAINTAINER gaddam.rahul@gmail.

SHELL ["/bin/bash", "-c"]

WORKDIR /workspace/EazyIntegration
COPY mapping /workspace/EazyIntegration/mapping/
COPY route /workspace/EazyIntegration/route/
COPY jbang/bin/jbang /workspace/EazyIntegration/
COPY start_monitoring.sh /workspace/EazyIntegration/

RUN chmod +x jbang
RUN chmod +x start_monitoring.sh
RUN mv jbang /usr/sbin/
RUN jbang
RUN jbang trust add https://github.com/apache/camel/
RUN jbang app install camel@apache/camel

EXPOSE 8080
EXPOSE 8888

ENV PATH="$PATH:/root/.jbang/bin"

CMD ["/bin/bash"]