# Docker Python3-Tensorflow-OpenCV3

A docker version with `python3`, `tensorflow:lastest` and `opencv 3` for compile and test everything Tensorflow-OpenCV based application

## Execute scripts

The following script will execute the scripts `/script/to/run; /or/set/of/them` as if they were run on your machine.

In order to see what is going inside the docker we need to sync the displays with:

`--env DISPLAY=$DISPLAY --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"` if you use **Linux based systems**.

`-e DISPLAY=${HOST_IP}:0` if you use **OSX systems**.


Also, we will share the source code directories `-v=$(pwd)/..:$(pwd)/..` (this assumes you are doing an out-of-source build and you have a parent directory with the `build` and `src` as children). And we set the current directory as our working directory `-w=$(pwd)`.

CPU version:

    docker run -it --rm \
      --env DISPLAY=$DISPLAY --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
      -v=$(pwd)/..:$(pwd)/.. -w=$(pwd) \
      tensorflow-opencv-cpu-py3 \
      /script/to/run; /or/set/of/them

GPU version:

    nvidia-docker run -it --rm \
      --env DISPLAY=$DISPLAY --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
      -v=$(pwd)/..:$(pwd)/.. -w=$(pwd) \
      tensorflow-opencv-gpu-py3 \
      /script/to/run; /or/set/of/them

or if you want enter in the image use the   `Makefile` commands:

Enter cpu version

    make run-cpu

Enter cpu version

    make run-gpu


## Build the image locally

You can build the image locally by executing the `Makefile`

Creating cpu version

    make build-cpu

Creating gpu version

    make build-gpu


Based on this [repo](https://github.com/adinriv/docker-opencv)

