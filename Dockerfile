#FROM nvcr.io/nvidia/pytorch:23.04-py3
FROM pytorch/pytorch:latest

ARG USER=standard
ARG USER_ID=1003 # uid from the previus step --> from command id and e3da group
ARG USER_GROUP=standard
ARG USER_GROUP_ID=1003 # gid from the previus step --> from command id and e3da
ARG USER_HOME=/home/${USER}

# create a user group and a user (this works only for debian based images)
RUN groupadd --gid $USER_GROUP_ID $USER \
    && useradd --uid $USER_ID --gid $USER_GROUP_ID -m $USER
# setup image istructions
#RUN apt-get update && apt-get install -y curl ffmpeg libsm6 libxext6 libgl1

# Install linux packages
# g++ required to build 'tflite_support' package
RUN apt update \
    && apt install --no-install-recommends -y gcc git zip curl htop libgl1-mesa-glx libglib2.0-0 libpython3-dev gnupg g++
# RUN alias python=python3

# Security updates
# https://security.snyk.io/vuln/SNYK-UBUNTU1804-OPENSSL-3314796
RUN apt upgrade --no-install-recommends -y openssl tar

# set container user
USER $USER

RUN pip install pip install python-dotenv
RUN pip install ultralytics

# WORKDIR /home/e3da

#CMD ["./scripts/main.sh"]