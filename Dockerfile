FROM openjdk:19-jdk-oraclelinux8
MAINTAINER gaddam.rahul@gmail.

SHELL ["/bin/bash", "-c"]

WORKDIR /scratch/camel
COPY mapping /scratch/camel/mapping/
COPY route /scratch/camel/route/
COPY jbang/bin/jbang /scratch/camel/

RUN chmod +x jbang
RUN mv jbang /usr/sbin/
RUN jbang
RUN jbang trust add https://github.com/apache/camel/
RUN jbang app install camel@apache/camel
EXPOSE 8080
CMD ["camel","run","./route/remote-post-http.yaml","&"]