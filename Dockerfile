FROM jupyter/tensorflow-notebook:4d9c9bd9ced0  
# Tag I'm using for udpat (not yet pushed to github) : 2022-01-22

# I stopped using "latest" because conda became stupidly slow
# Last Succesful Used image: jupyter/tensorflow-notebook:feacdbfc2e89
# Last Test image: jupyter/tensorflow-notebook:4d9c9bd9ced0
USER root
WORKDIR /home/jovyan

# David's Code (Check if necessary)
ENV ENDPOINT_URL="https://s3.nautilus.optiputer.net"
ENV S3_ENDPOINT="s3.nautilus.optiputer.net"
ENV AWS_LOG_LEVEL=3
ENV TF_CPP_MIN_LOG_LEVEL=3

RUN git clone https://github.com/braingeneers/WetAI_Docker.git
RUN cd ~/WetAI_Docker/Code && chmod +x Set_Computer.sh && ./Set_Computer.sh

EXPOSE 80
EXPOSE 8888
CMD ["jupyter","notebook"]
