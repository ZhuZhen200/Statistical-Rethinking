#!/bin/bash

# Update and Upgrade System
sudo apt-get update && sudo apt-get upgrade -y

# Install C++ Toolchain
sudo apt-get install -y build-essential

# Install libzmq5 for Jupyter Notebook
sudo apt-get install -y libzmq5

# Install Python3 pip for jupyter-client
sudo apt-get install -y python3-pip

# Install jupyter-client
pip install jupyter-client

# Install R Packages
Rscript -e "install.packages(c('coda','mvtnorm','devtools','loo','dagitty','shape'), repos='http://cran.rstudio.com/')"

# Install cmdstanr and compile libraries
Rscript -e "devtools::install_github('stan-dev/cmdstanr', dependencies=c('Depends', 'Imports'))"
Rscript -e "cmdstanr::install_cmdstan()"

# Install rethinking package
Rscript -e "devtools::install_github('rmcelreath/rethinking')"

# Install IRkernel for Jupyter Notebook with R
Rscript -e "install.packages('IRkernel', repos='http://cran.rstudio.com/')"
Rscript -e "IRkernel::installspec(user = FALSE)"

echo "Post-create script completed."

## Run this command in your terminal where the .devcontainer directory 
## resides to grant executable permissions to the post-create.sh file.
# chmod +x .devcontainer/post-create.sh

## This is the git code:
# git add .devcontainer/post-create.sh .devcontainer/devcontainer.json
# git commit -m "Updated .devcontainer configuration for automatic setup"
# git push origin main

