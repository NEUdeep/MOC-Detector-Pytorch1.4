# Installation

>The Installation step is referenced from [CenterNet](https://github.com/xingyizhou/CenterNet/blob/master/readme/INSTALL.md).
>
><br/>
>
>**Our experimental environment:** 
>
> Ubuntu 18.04,  Python 3.6.9, PyTorch 1.4, torchvision 0.5.0.
>
> 8 NVIDIA 2080ti cuda10.0

<br/>

1. Create a new conda environment and activate the environment.

   ~~~powershell
   conda create --name MOC python=3.6
   conda activate MOC
   ~~~
   
2. Install pytorch1.4:

   ~~~powershell
   pip install in pytorch.org.
   - or you can use conda. 
   ~~~

   Disable cudnn batch normalization(follow [CenterNet](https://github.com/xingyizhou/pytorch-pose-hg-3d/issues/16)).
   
    For other pytorch version, you can manually open `torch/nn/functional.py` and find the line with `torch.batch_norm` and replace the `torch.backends.cudnn.enabled` with `False`. 

3. Clone this repo (${MOC_ROOT} is the path to clone):

   ~~~powershell
   git clone https://github.com/MCG-NJU/MOC-Detector.git ${MOC_ROOT}
   ~~~


4. Install the requirements

   ~~~powershell
   pip install -r requirments.txt -i https://mirrors.aliyun.com/pypi/simple
   ~~~

5. Compile deformable convolutional in DLA backbone follow [CenterNet](https://github.com/xingyizhou/CenterNet/blob/master/readme/INSTALL.md).

   ~~~powershell
   cd ${MOC_ROOT}/src/network/DCNv2
   python setup.py build develop
   - or you must check with https://github.com/CharlesShang/DCNv2.git to make sure that is for you.
   ~~~

6. If you have any problems, please check in [CenterNet](https://github.com/xingyizhou/CenterNet/issues).
