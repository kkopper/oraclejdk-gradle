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
ARG jdk=10.0.2
ARG jdk_link=http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.tar.gz
RUN wget -q --no-check-certificate --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        --output-document=oracle-jdk.tar.gz \
        ${jdk_link} && \
    tar -xzf oracle-jdk.tar.gz && \
    rm oracle-jdk.tar.gz

# Install Gradle
ARG gradle=4.10.2
RUN wget -q --no-check-certificate --output-document=gradle-bin.zip \
        https://services.gradle.org/distributions/gradle-${gradle}-bin.zip && \
    mkdir -p /opt/gradle && \
    unzip -q -d /opt/gradle gradle-bin.zip && \
    rm gradle-bin.zip

# Set environment variables
ENV JAVA_HOME "/jdk-${jdk}"
ENV PATH "${PATH}:${JAVA_HOME}/bin:/opt/gradle/gradle-${gradle}/bin"
