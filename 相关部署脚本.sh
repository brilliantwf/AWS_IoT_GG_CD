### 1. Jenkins部署

amazon-linux-extras install epel -y
yum update -y
sudo yum install jenkins java-1.8.0-openjdk-devel -y
sudo service jenkins start
chkconfig jenkins on
systemctl start jenkins.service
systemctl enable jenkins.service

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
### 2. docker 部署 
sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker jenkins
docker info
docker
systemctl start docker
sudo systemctl start docker
sudo systemctl enable docker

### 3.插件部署
Docker and Docker pipelines plug-in are installed

### 4. ECR 部署

aws ecr create-repository --repository-name gg-repo --region ap-southeast-1

aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin Your_Account.dkr.ecr.ap-southeast-1.amazonaws.com

git clone https://bitbucket.org/ananthkannan/mydockerrepo
cd mydockerrepo/pythonApp
docker build . -t mypythonapp

docker tag mypythonapp:latest Your_Account.dkr.ecr.ap-southeast-1.amazonaws.com/gg-repo:latest

docker push Your_Account.dkr.ecr.ap-southeast-1.amazonaws.com/gg-repo:latest