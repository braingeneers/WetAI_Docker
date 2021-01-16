# WetAI Docker

This code creates the docker container for WetAI. This is the main code for the entire WetAI project. WetAI is currently in development. More will be added to this readme later.

## Build Docker Image
**Clone Repository**

`git clone https://github.com/braingeneers/WetAI_Docker.git`

**Create Image from Files**
```
cd WetAI_Docker
docker build --no-cache -t pupster90/wetai:latest .  
```

## Helpful Docker Commands
**Run docker container**

`docker run -it --privileged -p 8891:80 -p 8871:8888 --name wet-io --user root jupyter/tensorflow-notebook:feacdbfc2e89 /bin/bash `

**Commit docker container**

`docker commit --change='CMD ["tini", "-g", "jupyter", "notebook"]' -c "EXPOSE 80" -c "EXPOSE 8888" io-test  pupster90/wet_io:v1.0.0`

**Save docker image**
```
docker tag pupster90/wet_io:latest pupster90/wet_io:v1.0.0
docker push pupster90/wet_io:latest
docker push pupster90/wet_io:v1.0.0
```
`
