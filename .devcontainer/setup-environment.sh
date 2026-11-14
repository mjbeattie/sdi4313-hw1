#!/usr/bin/env bash

set -x
set -e

echo "Creating or updating the SDI4313_HW1 Conda environment..."

conda env update \
    --name sdi4313_hw1 \
    --file sdi4313_conda_hw1.yml \
    --prune

echo "Checking the environment..."

conda run --name sdi4313_hw1 python --version
conda run --name sdi4313_hw1 python -m pip check

echo "Registering the Jupyter kernel..."

conda run --name sdi4313_hw1 python -m ipykernel install \
    --user \
    --name sdi4313_hw1 \
    --display-name "Python (SDI4313_HW1)"

echo "SDI4313_HW1 environment setup completed successfully."

echo "Configuring Conda for new terminals..."

conda init bash

grep -qxF "conda activate sdi4313_hw1" ~/.bashrc || \
    echo "conda activate sdi4313_hw1" >> ~/.bashrc

echo "New terminals will automatically activate the sdi4313_hw1 environment."
