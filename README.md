


# Helpful Docker Commands
**Run docker container**

`docker run -it --privileged -p 8891:80 -p 8871:8888 --name wet-io --user root jupyter/tensorflow-notebook:feacdbfc2e89 /bin/bash `

**Commit docker container**

`docker commit --change='CMD ["tini", "-g", "jupyter", "notebook"]' -c "EXPOSE 80" -c "EXPOSE 8888" io-test  pupster90/wet_io:v1.0.0`

**Create images from file**

`docker build --no-cache -t pupster90/wetai:latest .  `

**Save docker image**
```
docker tag pupster90/wet_io:latest pupster90/wet_io:v1.0.0
docker push pupster90/wet_io:latest
docker push pupster90/wet_io:v1.0.0
```
`
