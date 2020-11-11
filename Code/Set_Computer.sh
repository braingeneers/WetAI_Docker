VERSION_NAME=v1.0.0
# Set io's Version name in custom.js file
sed -i "s/{VERSION_NAME}/$VERSION_NAME/g"  ~/wetai_docker/Code/Set_Interface.js


############################################
############################################
#.    Code From Original io
############################################
############################################

# This section contains modified code that comes from the original io project: https://github.com/pupster90/io_docker_setup

### Setup Jupyter config file
echo "c.NotebookApp.ip = '0.0.0.0'" > ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.extra_static_paths = ['/home/jovyan/.js_files']" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.extra_template_paths = ['/root','...html/templates','...html']" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 80" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.allow_origin = '*'" >> ~/.jupyter/jupyter_notebook_config.py  
echo "c.NotebookApp.password = 'argon2:\$argon2id\$v=19\$m=10240,t=10,p=8\$lw1+5uzTxfAaGCmLcrQdQA\$5rTtD1TgWidh/JcE84jG4Q'" >> ~/.jupyter/jupyter_notebook_config.py 

### Generic Software Update
apt update
apt-get install update
conda update -y conda

### Install nb-extensiosn 
conda install -y -c conda-forge  rise
conda install -y -c conda-forge jupyter_contrib_nbextensions #conda install -y -c conda-forge jupyter_nbextensions_configurator
jupyter nbextensions_configurator enable
jupyter nbextension enable collapsible_headings/main
jupyter nbextension enable help_panel/help_panel
jupyter nbextension enable notify/notify
jupyter nbextension enable toc2/main
jupyter nbextension enable varInspector/main
jupyter nbextension enable codefolding/main
jupyter nbextension enable hide_header/main
jupyter nbextension enable hide_input_all/main
jupyter nbextension enable table_beautifier/main
jupyter nbextension enable codefolding/edit
jupyter nbextension enable contrib_nbextensions_help_item/main
jupyter nbextension enable python-markdown/main
jupyter nbextension enable move_selected_cells/main
jupyter nbextension enable splitcell/splitcell
jupyter nbextension enable tree-filter/index

# Install required python packages
pip install PyGithub
pip install timeago #pip install --upgrade google-cloud-datastore #pip install --upgrade firebase-admin
pip install redis
#pip install tensorflow==2.0.0-alpha0  #pip install keras

# Set Files from wet_io Github
mv ~/wetai_docker/Code/Set_Login.html /root/login.html
mv ~/wetai_docker/Welcome\ to\ WetAI\ \ .ipynb ~/
mkdir ~/.jupyter/custom && mv ~/wetai_docker/Code/Set_Interface.js ~/.jupyter/custom/custom.js 
mv ~/wetai_docker/Code/Password/Set_Password.py ~/.Set_Password.py
chmod +x ~/wetai_docker/Code/Password/password.sh && mv ~/wetai_docker/Code/Password/password.sh /usr/local/bin/password

# Create user's starting Apps & Files by downloading everything from github
cd ~ && mkdir Apps Documents                   #<-- Create folders
cd ~/Apps && mkdir  braingeneers
rm -rf ~/work ~/wetai_docker                   #<-- remove previous folders
#cd ~/Apps/braingeneers && git clone https://github.com/pupster90/Agora.git && git clone https://github.com/pupster90/Learn_io.git
cd ~/Apps/braingeneers && git clone https://github.com/pupster90/Agora.git && git clone https://github.com/braingeneers/Learn_WetAI.git
git clone cd ~/Apps/braingeneers && git clone https://github.com/pupster90/spikesort_easy.git
#cd ~/Documents && git clone https://github.com/pupster90/My_First_Research_Paper.git



############################################
############################################
#.    Braingeneers
############################################
############################################

# Code used by all braingeneers

conda install -y -c plotly plotly-orca
apt-get install -y --no-install-recommends awscli # Install aws
pip install --upgrade git+https://github.com/braingeneers/braingeneerspy.git # install braingeneers python package
cd ~ && mkdir .aws # Setup for AWS credentials file
touch ~/.aws/credentials

############################################
############################################
#.    David Parks
############################################
############################################
echo 'alias aws3="aws --endpoint https://s3.nautilus.optiputer.net s3"' >> ~/.bashrc
echo 'alias awsn="aws --endpoint https://s3.nautilus.optiputer.net"' >> ~/.bashrc


############################################
############################################
#.    Kate
############################################
############################################

# Setup to run Kate's Code
apt-get install -y xvfb libgtk2.0-0 libgconf-2-4

############################################
############################################
#.    Nico
############################################
############################################

# Setup to run Nico's Code

### Install Docker
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io
#dockerd & #commented because command doesn't work here

### Install SpikeSort
pip install spikeinterface ml_ms4alg boto3
apt-get -y update
apt-get -y install vim
pip install --upgrade kachery
pip install git+https://github.com/flatironinstitute/spikeforest2.git
