#!/bin/env sh

# install python modules

# check that we have the right version of pip
PIP_VERSION=$(pip --version | awk '{print $2}')
echo "Pip version is ${PIP_VERSION}"
if [ $PIP_VERSION == "18.0" ]; then
  # aws development
  echo aws tools
  #pip install --user --upgrade pip 
  pip install --user awscli
  pip install --user boto3
  echo linters
  pip install --user flake8
  pip install --user yamllint
  pip install --user cfn-lint
fi
