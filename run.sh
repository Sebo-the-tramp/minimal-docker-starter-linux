docker run --name test-microyolo --gpus all --rm -it --shm-size=32gb -v $PWD/volume:/workspace/ -v /raid/home/e3da/datasets/coco/:/workspace/datasets/coco/ yolo:latest bash 
