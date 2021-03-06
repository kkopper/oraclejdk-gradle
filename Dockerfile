FROM ubuntu:latest

LABEL maintainer="Konstantin Kopper"

# Install required packages
RUN apt-get -qq update --yes \
 && apt-get -qq install --yes --no-install-recommends \
    wget \
    tar \
    unzip \
 && rm -rf /var/lib/apt/lists/*

# Install Oracle JDK
ARG jdk=1.8.0_211
ARG jdk_link=https://download.oracle.com/otn/java/jdk/8u211-b12/478a62b7d4e34b78b671c754eaaf38ab/jdk-8u211-linux-x64.tar.gz
RUN wget -q --no-check-certificate --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        --output-document=oracle-jdk.tar.gz \
        ${jdk_link} && \
    tar -xzf oracle-jdk.tar.gz && \
    rm oracle-jdk.tar.gz

# Install Gradle
ARG gradle=5.4
RUN wget -q --no-check-certificate --output-document=gradle-bin.zip \
        https://services.gradle.org/distributions/gradle-${gradle}-bin.zip && \
    mkdir -p /opt/gradle && \
    unzip -q -d /opt/gradle gradle-bin.zip && \
    rm gradle-bin.zip

# Set environment variables
#ENV JAVA_HOME "/jdk-${jdk}"
ENV JAVA_HOME "/jdk${jdk}"
ENV PATH "${PATH}:${JAVA_HOME}/bin:/opt/gradle/gradle-${gradle}/bin"
