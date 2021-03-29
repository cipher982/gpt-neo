#!/usr/bin/env bash

# Configure git
git config --global user.email "david010@gmail.com"
git config --global user.name "David Rose"

# Install g-cloud software
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk

# Download the wine dataset
gsutil -m cp -r gs://wine-gpt/scraped_wines.tfrecord /content/gpt-neo/scraped_wines.tfrecord

# Download the GPT3 model
mkdir /content/model_store
gsutil -m cp -r gs://wine-gpt/GPT3_XL /content/model_store/

# Download the pretrained model
#wget -m -np -c -U "eye02" -w 2 -R "index.html*" "https://the-eye.eu/public/AI/gptneo-release/GPT3_XL/"
