# Ubuntu base image
FROM ubuntu:latest

# update system
RUN apt-get -y update
RUN apt-get -y upgrade

# install dependencies
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get -qq -y install curl wget unzip zip bc
RUN apt -y install openjdk-11-jdk
RUN apt -y install git maven

# obtain DL tools
WORKDIR "/omPlanner"
RUN git clone https://github.com/de-tu-dresden-inf-lat/lat-scala-dl-tools.git
WORKDIR "/omPlanner/lat-scala-dl-tools"
RUN mvn clean install
WORKDIR "/"


# install sdkman, Java SDK and sbt
RUN  curl -s "https://get.sdkman.io" | bash 
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"  \
	&& sdk install java $(sdk list java | grep -o "\b8\.[0-9]*\.[0-9]*\-tem" | head -1) \
	&& sdk install sbt 

# copy necessary files from project
ADD implementation/src /omPlanner/implementation/src
ADD implementation/project /omPlanner/implementation/project
ADD implementation/build.sbt /omPlanner/implementation/build.sbt


# build project
WORKDIR "/omPlanner/implementation"
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"  \
	&& sbt assembly
WORKDIR "/"

# get fork of FD planner
RUN apt -y install cmake g++ git make python3
WORKDIR "/omPlanner"
RUN git clone -b release_22_12_0 https://github.com/remaro-network/downward.git
RUN mv downward downward-release-22.12.0-patched
WORKDIR "/omPlanner/downward-release-22.12.0-patched"
RUN ./build.py
WORKDIR "/"

# copy scripts to run planning
ADD coordinator /omPlanner/coordinator
ADD omPlanner.sh /omPlanner/omPlanner.sh

# copy some examples
ADD examples/blocksworld /omPlanner/examples/blocksworld
ADD examples/drones /omPlanner/examples/drones
ADD examples/pipes /omPlanner/examples/pipes
ADD examples/queens /omPlanner/examples/queens
ADD examples/robotConj /omPlanner/examples/robotConj
ADD examples/performance_check /omPlanner/examples/performance_check


# test if everything works
WORKDIR "/omPlanner"
#CMD [ "./omPlanner/omPlanner.sh", "examples/performance_check/pipesA-8", "pipesA-8.ttl", "pipes.pddl", "pipesProblemA-8.pddl" ]
ENTRYPOINT [ "./omPlanner.sh" ]

