VERSION_NAME=v5.0.0
sed -i "s/{VERSION_NAME}/$VERSION_NAME/g"  ~/WetAI_Docker/Code/Set_Interface.js # Set version name in custom.js file
apt update; apt-get update; conda update -y conda  # Generic Updates


############################################
#.    Set Up Jupyter Environemnet
############################################

### Setup Jupyter config file
echo "c.NotebookApp.ip = '0.0.0.0'" > ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.extra_static_paths = ['/home/jovyan/.js_files']" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.extra_template_paths = ['/root','...html/templates','...html']" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 80" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.allow_origin = '*'" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.password = 'argon2:\$argon2id\$v=19\$m=10240,t=10,p=8\$lw1+5uzTxfAaGCmLcrQdQA\$5rTtD1TgWidh/JcE84jG4Q'" >> ~/.jupyter/jupyter_notebook_config.py 

### Install extensions 
conda install -y -c conda-forge jupyter_contrib_nbextensions #conda install -y -c conda-forge jupyter_nbextensions_configurator
jupyter nbextensions_configurator enable
for package in collapsible_headings/main varInspector/main notify/notify toc2/main codefolding/main hide_header/main hide_input_all/main table_beautifier/main codefolding/edit help_panel/help_panel contrib_nbextensions_help_item/main python-markdown/main move_selected_cells/main splitcell/splitcell tree-filter/index; do jupyter nbextension enable $package; done;

# Set Files from wet_io Github
mv ~/WetAI_Docker/Code/Set_Login.html /root/login.html
mkdir ~/.jupyter/custom && mv ~/WetAI_Docker/Code/Set_Interface.js ~/.jupyter/custom/custom.js 
mv ~/WetAI_Docker/Code/Password/Set_Password.py ~/.Set_Password.py
chmod +x ~/WetAI_Docker/Code/Password/password.sh && mv ~/WetAI_Docker/Code/Password/password.sh /usr/local/bin/password
cd ~ && git clone https://github.com/pupster90/tutorials.git



############################################
#.   Set Up Braingeneers Installations
############################################

# Code used by all braingeneers
pip install --upgrade git+https://github.com/braingeneers/braingeneerspy.git # install braingeneers python package

# Install pip packages
apt install -y  zip unzip              # Basic Package
apt-get -y install vim                 # Basic Package
pip install smart_open                 # For data analysis
pip install torch                      # Data analysis Packages
pip install colour                     # Data analysis Packages
pip install plotly                     # Data analysis Packages
pip install redis                     # Packages for IoT Messaging
pip install s4cmd                      # Packages for IoT Messaging

# AWS Code
apt-get install -y --no-install-recommends awscli # Install aws
cd ~ && mkdir .aws                                # Setup for AWS credentials file
# Set alias: https://stackoverflow.com/questions/36388465/how-to-set-bash-aliases-for-docker-containers-in-dockerfile
echo -e '#!/bin/bash\naws --endpoint https://s3.nautilus.optiputer.net s3 "$@"' > /usr/bin/aws3 && chmod +x /usr/bin/aws3
echo -e '#!/bin/bash\naws --endpoint https://s3.nautilus.optiputer.net "$@"' > /usr/bin/awsn && chmod +x /usr/bin/awsn
#pip install -Iv awsiotsdk==1.5.7       # Packages for IoT Messaging
#pip install -v awscrt==0.10.8          # Packages for IoT Messaging
pip install awswrangler                #install aws package

# Install Kubernetes 
apt -y install curl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

rm -rf ~/WetAI_Docker  #<-- Clean up folders

