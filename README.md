
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


# Client certificates and config
https://drive.google.com/file/d/1LZjRLvpqXdy99Qoqr7BsitP-YYIYFlNY/view?usp=sharing



OpenVPN setup instructions
https://aws.amazon.com/blogs/awsmarketplace/setting-up-openvpn-access-server-in-amazon-vpc/
https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-16-04
https://tunnelblick.net/cConnectedBut.html#how-to-use-a-different-dns-server

