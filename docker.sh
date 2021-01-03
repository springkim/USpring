curl https://get.docker.com | sh && sudo systemctl start docker && sudo systemctl enable docker

sudo usermod -aG docker $USER

sudo docker --version

sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker
