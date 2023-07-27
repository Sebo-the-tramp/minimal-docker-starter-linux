#!/bin/bash

# Define variables
containername="3_heads_phinet_alpha_033_500_epochs"

# Run docker
docker run --name $containername --gpus all --rm -it --shm-size=32gb -e "DOCKER_CONTAINER_NAME=$containername" -v  $PWD/volume:/workspace/ -v /raid/home/e3da/interns/scavada/datasets/coco/:/workspace/micromind/recipes/segmentation/datasets/coco/ -v /raid/home/e3da/interns/scavada/datasets/coco/:/workspace/micromind/recipes/detection/datasets/coco/ microyolo-docker:1.0 bash