#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <environment_name>"
  exit 1
fi

# Assign the arguments to variables
environment_name="$1"

# Create a Conda environment from the 'dev-dependencies.yml' file
conda env create --name "$environment_name" --file ./dev-dependencies.yml --force

# Install the 'ipykernel' package in the created environment
conda install -n "$environment_name" ipykernel -y

# Install the IPython kernel with the specified display name
/anaconda/envs/"$environment_name"/bin/python -m ipykernel install --user --name "$environment_name" --display-name "$environment_name"
