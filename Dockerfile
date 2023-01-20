# Docker with JDK, JMETER & JMETER PLUGINS INSTALLED
FROM ubuntu:18.04

ARG JMETER_VERSION="5.5"
ARG CMDRUNNER_JAR_VERSION="2.2"
ARG JMETER_PLUGINS_MANAGER_VERSION="1.7"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_LIB_FOLDER ${JMETER_HOME}/lib/
ENV JMETER_PLUGINS_FOLDER ${JMETER_LIB_FOLDER}ext/

WORKDIR ${JMETER_HOME}

RUN apt-get update

RUN apt-get install -y wget
#install git
RUN apt-get install -y git

RUN apt install -y default-jdk

RUN wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

RUN tar -xvf apache-jmeter-${JMETER_VERSION}.tgz

RUN mv apache-jmeter-${JMETER_VERSION}/* /opt/apache-jmeter-${JMETER_VERSION}

RUN rm -r /opt/apache-jmeter-${JMETER_VERSION}/apache-jmeter-${JMETER_VERSION}

WORKDIR ${JMETER_LIB_FOLDER}

#Download CMD RUNNER TO INSTALL PLUGIN MANAGER
RUN wget https://repo1.maven.org/maven2/kg/apc/cmdrunner/${CMDRUNNER_JAR_VERSION}/cmdrunner-${CMDRUNNER_JAR_VERSION}.jar

WORKDIR ${JMETER_PLUGINS_FOLDER}
#DOWNLOAD PLUGIN MANAGER
RUN wget https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/${JMETER_PLUGINS_MANAGER_VERSION}/jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar

WORKDIR ${JMETER_HOME}/bin
#Install Plugin
RUN java -cp ${JMETER_PLUGINS_FOLDER}jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

RUN ./PluginsManagerCMD.sh install jpgc-casutg
RUN ./PluginsManagerCMD.sh install jmeter.pack-listener, version: 1.7

#RUN mkdir code/

# Custom cache invalidation

ENV TZ=Asia/Kolkata
ARG CACHEBUST=1
RUN git config --global http.sslverify false

#RUN git clone https://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@github.com/svodhulu/Docker.git
RUN git clone https://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@github.com/rsahay408/DockerDemo.git
//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
#RUN wget https://drive.google.com/file/d/1epZtQ8FRnKHFRXRtLUNvM1_F5X3ui_MA/view?usp=drivesdk
#COPY /C:/Containers/Container3/jmeterrun.sh /opt/apache-jmeter-5.5/bin/code/jmeterrun.sh

WORKDIR ${JMETER_HOME}/bin/DockerDemo

ENTRYPOINT ["sh","Jmeterrun.sh"]