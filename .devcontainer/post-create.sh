#!/bin/bash

# Update and Upgrade System
apt-get update && apt-get upgrade -y

# Install C++ Toolchain
apt-get install -y build-essential

# Install R Packages
Rscript -e "install.packages(c('coda','mvtnorm','devtools','loo','dagitty','shape'), repos='http://cran.rstudio.com/')"
Rscript -e "devtools::install_github('stan-dev/cmdstanr', dependencies=c('Depends', 'Imports'))"
Rscript -e "cmdstanr::install_cmdstan()"
Rscript -e "devtools::install_github('rmcelreath/rethinking')"
