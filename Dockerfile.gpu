FROM tensorflow/tensorflow:1.11.0-gpu-py3
MAINTAINER Miguel Rodriguez <m.rodriguezs1990@gmail.com>

ENV OPENCV_VERSION 3.4.3
ENV NUM_CORES 4


# Install OpenCV
RUN apt-get -y update -qq && \
    apt-get -y install wget \
                       unzip \

                       # Required
                       build-essential \
                       cmake \
                       git \
                       pkg-config \
                       libatlas-base-dev \
                       libgtk2.0-dev \
                       libavcodec-dev \
                       libavformat-dev \
                       libswscale-dev \

                       # Optional
                       libtbb2 libtbb-dev \
                       libjpeg-dev \
                       libpng-dev \
                       libtiff-dev \
                       libv4l-dev \
                       libdc1394-22-dev \

                       qt4-default \

                       # Missing libraries for GTK
                       libatk-adaptor \
                       libcanberra-gtk-module \

                       # Tools
                       imagemagick \

                       # For use matplotlib.pyplot in python
                       python3-tk \
		       python-tk

WORKDIR /
    # Get OpenCV
RUN git clone https://github.com/opencv/opencv.git &&\
    cd opencv &&\
    git checkout $OPENCV_VERSION &&\
    cd / &&\
    # Get OpenCV contrib modules
    git clone https://github.com/opencv/opencv_contrib &&\
    cd opencv_contrib &&\
    git checkout $OPENCV_VERSION &&\
    mkdir /opencv/build &&\
    cd /opencv/build &&\

    # Lets build OpenCV
    cmake \
      -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \

      -D INSTALL_C_EXAMPLES=OFF \
      -D INSTALL_PYTHON_EXAMPLES=OFF \

      -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
      -D BUILD_EXAMPLES=OFF \

      -D BUILD_NEW_PYTHON_SUPPORT=ON \

      -D BUILD_DOCS=OFF \
      -D BUILD_TESTS=OFF \
      -D BUILD_PERF_TESTS=OFF \
      -D WITH_TBB=ON \
      -D WITH_OPENMP=ON \
      -D WITH_IPP=ON \
      -D WITH_CSTRIPES=ON \
      -D WITH_OPENCL=ON \
      -D WITH_V4L=ON \
      .. &&\
    make -j$NUM_CORES &&\
    make install &&\
    ldconfig &&\

    # Clean the install from sources
    cd / &&\
    rm -r /opencv &&\
    rm -r /opencv_contrib

RUN apt-get -y install libgtk-3-dev \
                       libboost-all-dev


RUN pip3 install tflearn
RUN pip3 install dlib
RUN pip3 install imutils
RUN pip3 install h5py
RUN pip3 install tqdm
RUN pip3 install jupyterlab
RUN pip3 install urllib3
RUN pip3 install mnist
RUN pip3 install keras
RUN pip3 install scikit-image

CMD ["/bin/bash"]
