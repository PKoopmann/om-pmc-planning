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









