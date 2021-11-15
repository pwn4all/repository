# &#35; how to install tensorflow 2.3.0 on ubuntu20.04

#### &#42; link
  <https://www.tensorflow.org/install/>  
  <https://towardsdatascience.com/installing-tensorflow-gpu-in-ubuntu-20-04-4ee3ca4cb75d/>  
  <https://kyungpyo-kim.github.io/study/tensorflow-gpu-installation-on-ubuntu20.04//>


* * *
#### &#35; need to match nvidia-cuda and cudnn version
#### 1-1. install nvidia-cuda
```bash
sudo apt install nvidia-cuda-toolkit
```

#### 1-2. check of cuda version. (this case : release 10.1)
```shell
$ nvidia-smi
Mon Jul 12 22:42:15 2021
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 460.80       Driver Version: 460.80       CUDA Version: 11.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  GeForce GT 730M     Off  | 00000000:01:00.0 N/A |                  N/A |
| N/A   45C    P8    N/A /  N/A |     61MiB /   983MiB |     N/A      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
$
$ nvcc -V
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2019 NVIDIA Corporation
Built on Sun_Jul_28_19:07:16_PDT_2019
Cuda compilation tools, release 10.1, V10.1.243
```

* * *
#### 2. download and install cudnn
  link : <http://people.cs.uchicago.edu/~kauffman/nvidia/cudnn/>
```bash
wget http://people.cs.uchicago.edu/~kauffman/nvidia/cudnn/cudnn-10.1-linux-x64-v7.6.5.32.tgz


tar -xvzf cudnn-10.1-linux-x64-v7.6.5.32.tgz ## need tensorflow version check
sudo cp cuda/include/cudnn.h /usr/lib/cuda/include/
sudo cp cuda/lib64/libcudnn* /usr/lib/cuda/lib64/

sudo chmod a+r /usr/lib/cuda/include/cudnn.h
sudo chmod a+r /usr/lib/cuda/lib64/libcudnn*

echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
```


* * *
#### &#35; need to match python and tensorflow version
#### 3. install tensorflow
  link : <http://people.cs.uchicago.edu/~kauffman/nvidia/cudnn/>
```bash
$ pip3 install tensorflow-gpu==2.3.0    # need to select version

$ python -V
Python 3.8.10

$ python
>>> import tensorflow as tf
2021-07-12 22:51:40.436650: I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcudart.so.10.1
>>>
>>> tf.config.list_physical_devices("GPU")
2021-07-12 22:51:49.593245: I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcuda.so.1
2021-07-12 22:51:49.625709: I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:982] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
2021-07-12 22:51:49.626062: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1716] Found device 0 with properties:
pciBusID: 0000:01:00.0 name: GeForce GT 730M computeCapability: 3.5
coreClock: 0.758GHz coreCount: 2 deviceMemorySize: 983.62MiB deviceMemoryBandwidth: 14.92GiB/s
2021-07-12 22:51:49.626097: I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcudart.so.10.1
2021-07-12 22:51:49.627897: I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcublas.so.10
2021-07-12 22:51:49.629521: I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcufft.so.10
2021-07-12 22:51:49.629828: I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcurand.so.10
2021-07-12 22:51:49.631691: I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcusolver.so.10
2021-07-12 22:51:49.632764: I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcusparse.so.10
2021-07-12 22:51:49.636765: I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcudnn.so.7
2021-07-12 22:51:49.636915: I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:982] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
2021-07-12 22:51:49.637366: I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:982] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
2021-07-12 22:51:49.637650: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1858] Adding visible gpu devices: 0
[PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]
>>>
>>> print(tf.__version__)
2.3.0
>>>
```


