FROM nvidia/cuda:9.0-devel-ubuntu16.04

 # TensorFlow version is tightly coupled to CUDA and cuDNN so it should be selected carefully
 ENV TENSORFLOW_VERSION=1.8.0
 ENV CUDNN_VERSION=7.0.5.15-1+cuda9.0
 ENV NCCL_VERSION=2.2.12-1+cuda9.0

 # Python 2.7 or 3.5 is supported by Ubuntu Xenial out of the box
 ARG python=3.5
 ENV PYTHON_VERSION=${python}

 RUN echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

 RUN apt-get update && apt-get install -y --no-install-recommends --allow-downgrades --allow-change-held-packages\
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

 RUN apt-get install -y --no-install-recommends openssh-client openssh-server && \
    mkdir -p /var/run/sshd
 # Allow OpenSSH to talk to containers without asking for confirmation
 RUN cat /etc/ssh/ssh_config | grep -v StrictHostKeyChecking > /etc/ssh/ssh_config.new && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config.new && \
    mv /etc/ssh/ssh_config.new /etc/ssh/ssh_config

 # Install TensorFlow
 RUN pip --default-timeout=100 install tensorflow

 RUN mkdir /tmp/openmpi && \
    cd /tmp/openmpi && \
    wget https://www.open-mpi.org/software/ompi/v3.0/downloads/openmpi-3.0.0.tar.gz && \
    tar zxf openmpi-3.0.0.tar.gz && \
    cd openmpi-3.0.0 && \
    ./configure --enable-orterun-prefix-by-default && \
    make -j $(nproc) all && \
    make install && \
    ldconfig && \
    rm -rf /tmp/openmpi

 RUN pip --no-cache-dir --default-timeout=100 install horovod
 # RUN HOROVOD_GPU_ALLREDUCE=NCCL pip install --no-cache-dir horovod
 WORKDIR "/notebooks"
