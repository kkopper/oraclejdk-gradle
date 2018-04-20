FROM ubuntu:latest

MAINTAINER Konstantin Kopper

RUN apt-get update --yes
RUN apt-get install --yes wget tar unzip
RUN wget -q --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" --output-document=oracle-jdk.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz
RUN tar -xzf oracle-jdk.tar.gz
RUN rm oracle-jdk.tar.gz
RUN wget -q --output-document=gradle-bin.zip https://services.gradle.org/distributions/gradle-4.7-bin.zip
RUN mkdir -p /opt/gradle
RUN unzip -q -d /opt/gradle gradle-bin.zip
RUN rm gradle-bin.zip

ENV JAVA_HOME "/jdk1.8.0_161"
ENV PATH "${PATH}:${JAVA_HOME}/bin:/opt/gradle/gradle-4.7/bin"
