
# alias commands David likes
#echo 'alias aws3="aws --endpoint https://s3.nautilus.optiputer.net s3"' >> ~/.bashrc
#echo 'alias awsn="aws --endpoint https://s3.nautilus.optiputer.net"' >> ~/.bashrc
echo -e '#!/bin/bash\naws --endpoint https://s3.nautilus.optiputer.net s3 "$@"' > /usr/bin/aws3 && chmod +x /usr/bin/aws3
echo -e '#!/bin/bash\naws --endpoint https://s3.nautilus.optiputer.net "$@"' > /usr/bin/awsn && chmod +x /usr/bin/awsn

# AWS Code
apt-get install -y --no-install-recommends awscli # Install aws
cd ~ && mkdir .aws # Setup for AWS credentials file
touch ~/.aws/credentials

# Packages for IoT Messaging in braingeneers
pip3 install redis
pip install -y awsiotsdk
