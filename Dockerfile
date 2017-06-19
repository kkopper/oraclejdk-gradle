FROM ubuntu:latest

MAINTAINER Konstantin Kopper

RUN apt-get update --yes
RUN apt-get install --yes wget tar unzip
RUN wget -q --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" --output-document=oracle-jdk.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
RUN tar -xzf oracle-jdk.tar.gz
RUN rm oracle-jdk.tar.gz
RUN wget -q https://services.gradle.org/distributions/gradle-3.5-bin.zip
RUN mkdir -p /opt/gradle
RUN unzip -q -d /opt/gradle gradle-3.5-bin.zip
RUN rm gradle-3.5-bin.zip

ENV JAVA_HOME "/jdk1.8.0_131"
ENV PATH "${PATH}:${JAVA_HOME}/bin:/opt/gradle/gradle-3.5/bin"
