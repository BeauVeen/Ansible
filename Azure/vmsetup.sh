#!/bin/bash

echo "Adding Azure credentials into .profile"
echo "export AZURE_SUBSCRIPTION_ID=8d9ee96d-4dfb-422e-880b-151705e0d558" >> ~/.profile
echo "export AZURE_CLIENT_ID=aaed754a-b964-4322-afaf-eea156e0ca67" >> ~/.profile
echo "export AZURE_SECRET=Jz78Q~EIHZsXH~3G8Yk4.hL696n_XTlRgJ9PPamm" >> ~/.profile
echo "export AZURE_TENANT=586e785a-8271-4fc6-a0c4-59fec8a68975" >> ~/.profile

source ~/.profile

echo "Updating machine and installing Ansible with dependencies"
sudo apt update -y

sudo apt install ansible -y
sudo apt install python3-pip -y 

ansible-galaxy collection install azure.azcollection --force

pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements.txt --break-system-packages

export PATH=$PATH:~/.local/bin/

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

pip install azure-cli-core --break-system-packages
pip install msrest azure-mgmt-compute azure-mgmt-network azure-mgmt-resource --break-system-packages

echo "Run 'az login --use-device-code' to verify your account and complete setup"
echo "Run 'ansible-playbook playbook.yml' to run your Ansible playbook"