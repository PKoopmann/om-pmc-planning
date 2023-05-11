# Installation
tested with Ubuntu 20.04
## Install Reasoner
### install Java, sbt
- install Java, e.g. `sudo apt install default-jre` `sudo apt install default-jdk`
- install JDK and sbt
`sudo apt-get install apt-transport-https curl gnupg -yqq`
   `sudo apt-get update`
    `sudo apt-get install apt-transport-https curl gnupg -yqq`
    `echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list`
    `echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list`
    `curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo -H gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import`
    `sudo chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg`
    `sudo apt-get update`
    `sudo apt-get install sbt`
- install Maven (to build DL tools)
`sudo apt install maven`


### obtain DL tools
clone from git
`git clone https://github.com/de-tu-dresden-inf-lat/lat-scala-dl-tools.git`
install
`mvn clean install`

### obtain reasoner
- clone repository
    - use git to clone repository 
`git clone https://gitlab.tcs.inf.tu-dresden.de/koopmann/om-pmc-formula-generation.git`
`cd om-pmc-formula-generation`
    - build from source
`cd implementation`
- build the tool
`sbt compile`
`sbt assembly`


## install FD
install dependencies for FD planner
`sudo apt install cmake g++ git make python3`
clone patched fork
`git clone -b release_22_12_0 https://github.com/remaro-network/downward.git`
rename folder (so script can find the planner)
`mv downward downward-release-22.12.0-patched`
move to folder
`cd downward-release-22.12.0-patched`
call "build"
`./build.py`
`cd`

## Obtain Horn-Reasoner
only necessary to run benchmark sets that include the Horn reasoning
Requirement: obtain DVL
`curl https://www.dlvsystem.it/files/dlv.i386-linux-elf-static.bin --output dlv`
make it executable
`chmod a+rx dlv`
`mkdir -p /usr/local/bin`
`sudo mv dlv /usr/local/bin`
Requirement: install unzip
`sudo apt install unzip`

clone repository in om-folder
`cd om-pmc-formula-generation`
`git clone https://gitlab.perspicuous-computing.science/a.kovtunova/pddl-horndl.git`
switch to (sub-) directory
`cd pddl-horndl/horn_dl_pddl_compiler`
clone clipper
`git clone https://github.com/ghxiao/clipper.git`
apply patch
`patch -ruN -p 1 -d clipper < ../clipper.patch`
rename folder
`mv clipper patchedClipper`
move reasoner directory to main folder
`cd ../..`
`mv pddl-horndl/horn_dl_pddl_compiler/ horn_dl_pddl_compiler`
remove unnecessary folder with rest of supplementary material
`rm -r -d -f pddl-horndl`
build clipper:
- build clipper
`cd horn_dl_pddl_compiler/patchedClipper`
`./build.sh`
`cd ../..`

## optional: install GraalVM
`mkdir graalvm`
`cd graalvm`
`wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.3.2/graalvm-ce-java11-linux-amd64-22.3.2.tar.gz`
`tar -xvzf graalvm-ce-java11-linux-amd64-22.3.2.tar.gz`
`sudo mkdir /usr/lib/jvm`
`sudo mv graalvm-ce-java11-22.3.2/ /usr/lib/jvm`

add to path:
`echo 'export PATH=/lib/jvm/graalvm-ce-java11-22.3.2/bin:$PATH' >> ~/.bashrc  `
`echo 'export JAVA_HOME=/usr/lib/jvm/graalvm-ce-java11-22.3.2' >> ~/.bashrc`
`source ~/.bashrc`
get back
`cd ..`




