#docker run --name test-microyolo --gpus all --rm -it --shm-size=32gb -v $PWD/volume:/workspace/ -v /raid/home/e3da/datasets/:/workspace/datasets/ microyolo-scavada-e3da-3:latest bash 
docker run --name test-microyolo-2 --gpus all --rm -it --shm-size=32gb -v $PWD/volume:/workspace/ microyolo-scavada-e3da-3:latest bash 