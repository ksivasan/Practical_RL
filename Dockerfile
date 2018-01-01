FROM andrewosh/binder-base
MAINTAINER Alexander Panin <justheuristic@gmail.com>
USER root

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get -qq update

RUN apt-get install -y gcc g++ wget unzip
RUN apt-get install -y libopenblas-dev liblapack-dev libsdl2-dev libboost-all-dev 
RUN apt-get install -y cmake zlib1g-dev libjpeg-dev 
RUN apt-get install -y xvfb libav-tools xorg-dev python-opengl python3-opengl
RUN apt-get -y install swig3.0
RUN ln -s /usr/bin/swig3.0 /usr/bin/swig


USER main
RUN conda uninstall gcc
RUN conda install -c serge-sans-paille gcc_49
#RUN conda install -y libgcc  # fix https://github.com/ContinuumIO/anaconda-issues/issues/483
RUN pip install --upgrade pip
RUN pip install --upgrade --ignore-installed setuptools  #fix https://github.com/tensorflow/tensorflow/issues/622
RUN pip install --upgrade sklearn tqdm nltk editdistance joblib
RUN pip install --upgrade gym[all]
RUN pip install --upgrade http://download.pytorch.org/whl/cu80/torch-0.3.0.post4-cp27-cp27mu-linux_x86_64.whl 
RUN pip install --upgrade torchvision 
#RUN pip install --upgrade tensorflow==1.4.0
RUN pip install --upgrade keras
RUN pip install --upgrade https://github.com/Theano/Theano/archive/master.zip
RUN pip install --upgrade https://github.com/Lasagne/Lasagne/archive/master.zip
RUN pip install --upgrade https://github.com/yandexdataschool/AgentNet/archive/master.zip
RUN pip install gym_pull
RUN pip install ppaquette-gym-doom

RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade pip
RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade sklearn tqdm nltk editdistance joblib
RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade --ignore-installed setuptools  #fix https://github.com/tensorflow/tensorflow/issues/622
RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade gym[all]
RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade http://download.pytorch.org/whl/cu80/torch-0.3.0.post4-cp35-cp35m-linux_x86_64.whl 
RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade torchvision
#RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade tensorflow==1.4.0
RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade keras
RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade https://github.com/Theano/Theano/archive/master.zip
RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade https://github.com/Lasagne/Lasagne/archive/master.zip
RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade https://github.com/yandexdataschool/AgentNet/archive/master.zip

#TODO py3 doom once it's no longer broken
