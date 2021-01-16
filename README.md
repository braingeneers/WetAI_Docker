# WetAI Docker

This code creates the docker container for WetAI. This is the main code for the entire WetAI project. WetAI is currently in development. More will be added to this readme later.

## Build Docker Image
**Clone Repository**

`git clone https://github.com/braingeneers/WetAI_Docker.git`

**Create Image from Files**
```
cd WetAI_Docker
docker build --no-cache -t braingeneers/wetai:latest .  
```

## Helpful Github Commands
**Get Changes from Github**

`git pull origin main`

## Helpful Docker Commands
**Run docker container**

`docker run -it --privileged -p 8800:80 -p 8900:8888 --name wetai-elliott --user root braingeneers/wetai:latest /bin/bash `

**Commit docker container**

`docker commit --change='CMD ["tini", "-g", "jupyter", "notebook"]' -c "EXPOSE 80" -c "EXPOSE 8888" wetai-test  braingeneers/wetai:v1.0.0`

**Save docker image**
```
docker tag braingeneers/wetai:latest braingeneers/wetai:v1.0.0
docker push braingeneers/wetai:latest
docker push braingeneers/wetai:v1.0.0
```
`
