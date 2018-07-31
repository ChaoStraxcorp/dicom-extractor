FROM continuumio/miniconda3:4.5.4

COPY . /app

WORKDIR /app
  
RUN conda install -c conda-forge gdcm
  
RUN apt-get update && \
  apt-get install -y zip && \
  pip install awscli
