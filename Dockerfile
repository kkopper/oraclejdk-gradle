FROM ubuntu:latest

MAINTAINER Konstantin Kopper

RUN apt-get update --yes
RUN apt-get install --yes wget tar unzip
RUN wget -q --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" --output-document=oracle-jdk.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz
RUN tar -xzf oracle-jdk.tar.gz
RUN rm oracle-jdk.tar.gz
RUN wget -q --output-document=gradle-bin.zip https://services.gradle.org/distributions/gradle-4.7-bin.zip
RUN mkdir -p /opt/gradle
RUN unzip -q -d /opt/gradle gradle-bin.zip
RUN rm gradle-bin.zip

ENV JAVA_HOME "/jdk1.8.0_171"
ENV PATH "${PATH}:${JAVA_HOME}/bin:/opt/gradle/gradle-4.7/bin"
