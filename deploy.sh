#!/bin/bash
set -eux

# 依存関係を./distにインストール
pip install -r requirements.txt -t ./dist
# gdcm関連パッケージを./distにコピー
cp -r /opt/conda/lib/python3.6/site-packages/*gdcm* ./dist
mkdir -p ./dist/lib
cp -r /opt/conda/lib/*gdcm* ./dist/lib

# 容量削減のためtestsファイルを削除
rm -rf ./dist/**/tests

# メインファイルを./distにコピー
cp ./main.py ./dist
cp ./sample/explicit_ct_jpeg-lossless-nh_mono2.dcm ./dist
zip -r deploy.zip .
aws lambda update-function-code --function-name dicom-extractor --zip-file fileb:///app/dist/deploy.zip
