#! /bin/bash

RELEASE_DATE=2023-09-17
RELEASE_VERSION=2.2.224
if curl -L https://github.com/h2database/h2database/releases/download/version-${RELEASE_VERSION}/h2-${RELEASE_DATE}.zip -o h2.zip; then
    unzip ./h2.zip -d . 
    sudo cp ./h2/bin/h2-${RELEASE_VERSION}.jar ./h2.jar
    sudo docker build . -t h2database
    del ./h2
    del ./h2.*
    echo "Database setup finished successfully!"
else
    echo "Error occured while trying to setup Database"
fi; 

