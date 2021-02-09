
# alias commands David likes
echo 'alias aws3="aws --endpoint https://s3.nautilus.optiputer.net s3"' >> ~/.bashrc
echo 'alias awsn="aws --endpoint https://s3.nautilus.optiputer.net"' >> ~/.bashrc


# Packages for IoT Messaging in braingeneers
pip install -y awsiot
pip install -y awscrt
