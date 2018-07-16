FROM ubuntu:latest

MAINTAINER Konstantin Kopper

RUN apt-get update --yes
RUN apt-get install --yes wget tar unzip
RUN wget -q --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" --output-document=oracle-jdk.tar.gz http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.tar.gz
RUN tar -xzf oracle-jdk.tar.gz
RUN rm oracle-jdk.tar.gz
RUN wget -q --output-document=gradle-bin.zip https://services.gradle.org/distributions/gradle-4.9-bin.zip
RUN mkdir -p /opt/gradle
RUN unzip -q -d /opt/gradle gradle-bin.zip
RUN rm gradle-bin.zip

ENV JAVA_HOME "/jdk-10.0.1"
ENV PATH "${PATH}:${JAVA_HOME}/bin:/opt/gradle/gradle-4.9/bin"
