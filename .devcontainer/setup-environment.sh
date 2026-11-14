#!/usr/bin/env bash

set -x
set -e

echo "Creating or updating the DSI4313_HW1 Conda environment..."

conda env update \
    --name aai4323_hw10 \
    --file aai4323_conda_hw10.yml \
    --prune

echo "Checking the environment..."

conda run --name sdi4313_hw1 python --version
conda run --name sdi4313_hw1 python -m pip check

echo "Registering the Jupyter kernel..."

conda run --name sdi4313_hw1 python -m ipykernel install \
    --user \
    --name sdi4313_hw10 \
    --display-name "Python (SDI4313_HW1)"

echo "AAI4323_HW10 environment setup completed successfully."

echo "Configuring Conda for new terminals..."

conda init bash

grep -qxF "conda activate aai4323_hw10" ~/.bashrc || \
    echo "conda activate aai4323_hw10" >> ~/.bashrc

echo "New terminals will automatically activate the aai4323_hw10 environment."
