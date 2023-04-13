# This file sets up the password
# It can be run in the commandline. We move it to the /usr/bin folder so can be run as a command.
dockerd &

PASSWORD="$1";
if [ "$1" == '--http' ]; then
    cd ~/.jupyter && openssl req -x509 -batch  -nodes -days 999 -newkey rsa:2048 -keyout mykey.key -out mycert.pem;
    echo "c.NotebookApp.certfile = u'/home/jovyan/.jupyter/mycert.pem'" >> ~/.jupyter/jupyter_notebook_config.py;
    echo "c.NotebookApp.keyfile =  u'/home/jovyan/.jupyter/mykey.key'"  >> ~/.jupyter/jupyter_notebook_config.py;
    PASSWORD="$2"
fi

cd ~/ && python .Set_Password.py $PASSWORD;
cd ~/ && jupyter notebook
