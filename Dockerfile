FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libopencv-dev \
    python3 python3-pip git wget unzip libgl1-mesa-glx && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create symlink for python3
RUN ln -s /usr/bin/python3 /usr/bin/python

# Install PyTorch with CUDA support
#RUN pip3 install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118



# Clone YOLOv7 repository
RUN git clone https://github.com/WongKinYiu/yolov7.git && \
    cd yolov7 && \
    pip3 install --no-cache-dir -r requirements.txt

# Set working directory
WORKDIR /workspace/yolov7

# Default command
CMD ["/bin/bash"]
