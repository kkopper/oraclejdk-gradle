FROM ubuntu:latest

MAINTAINER Konstantin Kopper

# Install required packages
RUN apt-get -qq update --yes && apt-get -qq install --yes \
    wget \
    tar \
    unzip

# Install Oracle JDK
RUN wget -q --no-check-certificate --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        --output-document=oracle-jdk.tar.gz \
        http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.tar.gz && \
    tar -xzf oracle-jdk.tar.gz && \
    rm oracle-jdk.tar.gz

# Install Gradle
RUN wget -q --output-document=gradle-bin.zip \
        https://services.gradle.org/distributions/gradle-4.9-bin.zip && \
    mkdir -p /opt/gradle && \
    unzip -q -d /opt/gradle gradle-bin.zip && \
    rm gradle-bin.zip

# Set environment variables
ENV JAVA_HOME "/jdk-10.0.1"
ENV PATH "${PATH}:${JAVA_HOME}/bin:/opt/gradle/gradle-4.9/bin"
