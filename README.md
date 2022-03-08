# WetAI Docker

This code creates the docker container for WetAI. This is the main code for the entire WetAI project. WetAI is currently in development. More will be added to this readme later.

## Useful Resources
* [WetAI Docker Page](https://hub.docker.com/r/braingeneers/wetai)
* [WetAI Wiki Page](https://github.com/braingeneers/wiki)


## Build Docker Image
**Clone Repository**
```
git clone https://github.com/braingeneers/WetAI_Docker.git
```

**Update repo to latest version**

```
git pull origin main
```

**Create Image from Files**
```
cd WetAI_Docker
docker build --no-cache -t braingeneers/wetai:latest .  
```

## Helpful Docker Commands



**Run docker on MaxONe**

```
docker run -it --name wetai --network host --user root -v /home/maxone/wetai/Projects:/home/jovyan/Projects -v /home/maxone/wetai/Data:/home/jovyan/Data  braingeneers/wetai /bin/bash
```

**Run docker with Volume**

Volumes let us share a container's files outside of the docker. We create the folder we want to share, make it public, and then run docker.
```
mkdir kate && mkdir kate/Projects && mkdir kate/Data
docker run -it --privileged -p 8803:80 --name wetai-kate --user root -v /public/home/melliot1/kate/Projects:/home/jovyan/Projects -v /public/home/melliot1/kate/Data:/home/jovyan/Data braingeneers/wetai:4.0.1 /bin/bash
# inside docker run: password whatever
```

**Commit docker container**

```
docker commit --change='CMD ["tini", "-g", "jupyter", "notebook"]' -c "EXPOSE 80" -c "EXPOSE 8888" wetai-test  braingeneers/wetai:v1.0.0
```

**Save docker image**
```
docker tag braingeneers/wetai:latest braingeneers/wetai:v1.0.0
docker push braingeneers/wetai:latest
docker push braingeneers/wetai:v1.0.0
```

***Start Docker Programm on Linux CentOS***
```
sudo systemctl start docker
```
