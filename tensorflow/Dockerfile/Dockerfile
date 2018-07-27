FROM nvidia/cuda:9.0-devel-ubuntu16.04
 
 # TensorFlow version is tightly coupled to CUDA and cuDNN so it should be selected carefully
 ENV TENSORFLOW_VERSION=1.8.0
 ENV CUDNN_VERSION=7.0.5.15-1+cuda9.0
 ENV NCCL_VERSION=2.2.12-1+cuda9.0
 
 # Python 2.7 or 3.5 is supported by Ubuntu Xenial out of the box
 ARG python=3.5
 ENV PYTHON_VERSION=${python}
 
 RUN echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list
 
 RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         vim \
         wget \
         ca-certificates \
         libcudnn7=${CUDNN_VERSION} \
         libnccl2=${NCCL_VERSION} \
         libnccl-dev=${NCCL_VERSION} \
         libjpeg-dev \
         libpng-dev \
         python${PYTHON_VERSION} \
         python${PYTHON_VERSION}-dev
 
 RUN ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python
 
 RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
     python get-pip.py && \
     rm get-pip.py
 
 # Install TensorFlow and Keras
 RUN pip install tensorflow-gpu==${TENSORFLOW_VERSION}
 
 WORKDIR "/notebooks"
