# WetAI Docker

This code creates the docker container for WetAI. This is the main code for the entire WetAI project. WetAI is currently in development. More will be added to this readme later.

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
**Run docker container**

```
docker run -it --privileged -p 8800:80 -p 8900:8888 --name wetai-elliott --user root braingeneers/wetai:latest /bin/bash
```

**Run docker with Volume**

Volumes let us share a container's files outside of the docker. We create the folder we want to share, make it public, and then run docker.
```
mkdir kate
chmod a+rwx -R kate
docker run -it --privileged -p 8803:80 -p 8903:8888 --name wetai-kate --user root -v /public/home/melliot1/kate:/home/jovyan/Projects braingeneers/wetai:v2.0.2 /bin/bash
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
`
