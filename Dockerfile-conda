# Thanks https://stackoverflow.com/questions/69874405/installing-conda-packages-in-docker-via-dockerfile

# Use the above args
ARG CONDA_VER=latest
ARG OS_TYPE=x86_64
ARG PY_VER=3.9

ARG UBUNTU_VER=20.04

FROM ubuntu:${UBUNTU_VER}

# System packages
RUN apt-get update && apt-get install -yq curl wget jq vim

ARG USER=e3da
ARG USER_ID=1001
ARG USER_GROUP=e3da
ARG USER_GROUP_ID=1001
ARG USER_HOME=/home/${USER}

# create a user group and a user (this works only for debian based images)
RUN groupadd --gid $USER_GROUP_ID $USER \
    && useradd --uid $USER_ID --gid $USER_GROUP_ID -m $USER \
    && chpasswd && adduser $USER sudo
RUN mkdir -p $USER_HOME

# Install miniconda to /miniconda
ARG CONDA_VER
ARG OS_TYPE
RUN curl -LO "http://repo.continuum.io/miniconda/Miniconda3-${CONDA_VER}-Linux-${OS_TYPE}.sh"
RUN bash Miniconda3-${CONDA_VER}-Linux-${OS_TYPE}.sh -p ${USER_HOME}/.miniconda -b
RUN rm Miniconda3-${CONDA_VER}-Linux-${OS_TYPE}.sh

ARG USER
RUN chown -R ${USER}: $USER_HOME
USER $USER

ENV PATH=${USER_HOME}/.miniconda/bin:${PATH}
RUN conda init

ARG PY_VER
# Install packages from conda
RUN conda install -c anaconda -y python=${PY_VER}
RUN conda install -c anaconda -y h5py

COPY requirements.txt .
RUN pip install -r requirements.txt --user

WORKDIR $USER_HOME
