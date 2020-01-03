
# Get and install terraform 0.12.18
wget https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip
unzip terraform_0.12.18_linux_amd64.zip
sudo mv terraform /bin/
terraform version

# Install AWS CLI
pip3 install awscli --upgrade --user
aws --version


# Configure AWS CLI user
aws configure --profile ec2_admin_user
export AWS_PROFILE=ec2_admin_user


