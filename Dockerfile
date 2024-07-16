# Ubuntu base image
FROM ubuntu:latest

# update system
RUN apt-get -y update
 
RUN apt-get -y upgrade

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get -qq -y install curl wget unzip zip
RUN apt -y install openjdk-11-jdk
RUN apt -y install git maven

# install JAVA
#RUN apt -y install default-jre
#RUN apt -y install default-jdk

#RUN apt -y install openjdk-11-jdk



# install sdkman and sdk
#RUN  curl -s "https://get.sdkman.io" | bash 
#RUN source "$HOME/.sdkman/bin/sdkman-init.sh"  \
#	&& sdk install java $(sdk list java | grep -o "\b8\.[0-9]*\.[0-9]*\-tem" | head -1) \
#	&& sdk install sbt 

RUN java -version
# obtain DL tools
RUN git clone https://github.com/de-tu-dresden-inf-lat/lat-scala-dl-tools.git
WORKDIR "/lat-scala-dl-tools"
RUN mvn clean install

# install sdkman and sdk
RUN  curl -s "https://get.sdkman.io" | bash 
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"  \
	&& sdk install java $(sdk list java | grep -o "\b8\.[0-9]*\.[0-9]*\-tem" | head -1) \
	&& sdk install sbt 

WORKDIR "/"
# copy project
ADD implementation/ /implementation/

# build project
WORKDIR "/implementation"
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"  \
	&& sbt assembly


# TODO: add file to prevent logging

