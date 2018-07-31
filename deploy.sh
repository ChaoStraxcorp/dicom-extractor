#!/bin/bash
set -eux

cd ./dist
zip -r deploy.zip .
aws lambda update-function-code --function-name dicom-extractor --zip-file fileb:///app/dist/deploy.zip
