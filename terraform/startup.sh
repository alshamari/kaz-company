curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user 
sudo python -m pip install ansible 
sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common 
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" 
sudo apt-get update
sudo apt-get install -y docker-ce 
docker pull alshamari/myapp:latest
docker run alshamari/myapp:latest

