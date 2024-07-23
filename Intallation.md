# Installation
We tested this installation instructions on machines running Ubuntu 20.04
## Install Tool
### install Java, sbt, maven
- install Java, e.g.
  ```
  sudo apt install default-jre
  sudo apt install default-jdk
  ```
- install sbt
  ```
  sudo apt-get install apt-transport-https curl gnupg -yqq
  echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
  echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
  curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo -H gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
  sudo chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
  sudo apt-get update
  sudo apt-get install sbt
  ```
- install Maven (to build DL tools)
```
sudo apt install maven
```

### obtain DL tools
clone from git and publish locally with maven
```
git clone https://github.com/de-tu-dresden-inf-lat/lat-scala-dl-tools.git
mvn clean install
```

### obtain reasoner
- clone this repository
    - use git to clone repository 
```
git clone https://github.com/PKoopmann/om-pmc-planning
```
- build source files
```
cd om-pmc-formula-generation/implementation
sbt compile
sbt assembly
cd ..
````

## Install Fast-Downward planner
- install dependencies for FD planner
```
sudo apt install cmake g++ git make python3
```
- clone patched fork
```
git clone -b release_22_12_0 https://github.com/remaro-network/downward.git
```
- rename directory (so script can find the planner)
```
mv downward downward-release-22.12.0-patched
```
move to directory and build
```
cd downward-release-22.12.0-patched
./build.py
cd ..
```
### Comments on installing FD planner
- We tested our system with the release version 22.12 of [Fast Downward planner](https://www.fast-downward.org/HomePage), which we needed to slightly modify and can be obtained via [this fork](https://github.com/remaro-network/downward/tree/release_22_12_0).
- If you do not store the planner in a directory `downward-release-22.12.0-patched` in the same folder as this readme, you need to provide the correct path to the `fast-downward.py` script in [coordinator/config](coordinator/config.txt).
