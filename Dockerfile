FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    wget \
    openjdk-8-jdk \
    curl \
    vim \
    unzip \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN export JAVA_HOME

RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz \
    && tar xzvf apache-tomcat-9.0.62.tar.gz \
    && mv apache-tomcat-9.0.62 /opt/tomcat \
    && rm apache-tomcat-9.0.62.tar.gz


RUN wget https://get.jenkins.io/war-stable/latest/jenkins.war -P /opt/tomcat/webapps/
RUN chmod +x /opt/tomcat/bin/*.sh
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
