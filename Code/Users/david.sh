
# Add environmental variables
# Set Environments: https://unix.stackexchange.com/questions/117467/how-to-permanently-set-environmental-variables
#echo 'ENDPOINT_URL="https://s3.nautilus.optiputer.net"' >> ~/.profile
#echo 'S3_ENDPOINT="s3.nautilus.optiputer.net"' >> ~/.profile
#echo 'AWS_LOG_LEVEL=3' >> ~/.profile
#echo 'TF_CPP_MIN_LOG_LEVEL=3' >> ~/.profile
# alias commands David likes
#echo 'alias aws3="aws --endpoint https://s3.nautilus.optiputer.net s3"' >> ~/.bashrc
#echo 'alias awsn="aws --endpoint https://s3.nautilus.optiputer.net"' >> ~/.bashrc

# AWS Code
apt-get install -y --no-install-recommends awscli # Install aws
cd ~ && mkdir .aws && touch ~/.aws/credentials  # Setup for AWS credentials file
# Set alias: https://stackoverflow.com/questions/36388465/how-to-set-bash-aliases-for-docker-containers-in-dockerfile
echo -e '#!/bin/bash\naws --endpoint https://s3.nautilus.optiputer.net s3 "$@"' > /usr/bin/aws3 && chmod +x /usr/bin/aws3
echo -e '#!/bin/bash\naws --endpoint https://s3.nautilus.optiputer.net "$@"' > /usr/bin/awsn && chmod +x /usr/bin/awsn


# Packages for IoT Messaging in braingeneers
pip3 install redis
pip install s4cmd
pip install -Iv awsiotsdk==1.5.7
pip install -v awscrt==0.10.8

# Install Kubernetes 
apt -y install curl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
