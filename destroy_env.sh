#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <environment_name>"
  exit 1
fi

# Assign the argument to a variable
environment_name="$1"

conda init bash

conda activate "$environment_name"

# Uninstall the unwanted Jupyter kernel
jupyter kernelspec uninstall "$environment_name" -y

conda deactivate

# # Remove the Conda environment with all its packages
conda remove --name "$environment_name" --all -y
