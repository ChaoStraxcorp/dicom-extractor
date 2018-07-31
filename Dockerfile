FROM continuumio/miniconda3:4.5.4

WORKDIR /app
  
RUN conda install -c conda-forge gdcm && \
  pip install -r requirements.txt -t ./dist && \
  cp -r /opt/conda/lib/python3.6/site-packages/*gdcm* ./dist && \
  mkdir -p ./dist/lib && \
  cp -r /opt/conda/lib/*gdcm* ./dist/lib
  
RUN apt-get update && \
  apt-get install -y zip && \
  pip install awscli
