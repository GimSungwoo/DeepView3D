#!/usr/bin/env bash
#SBATCH -N 1      # nodes requested
#SBATCH -n 1      # tasks requested
#SBATCH --partition=Standard
#SBATCH --gres=gpu:4
#SBATCH --mem=12000  # memory in Mb
#SBATCH --time=0-8:00:00

export CUDA_HOME=/opt/cuda-9.0.176.1/

export CUDNN_HOME=/opt/cuDNN-7.0/

export STUDENT_ID=$(whoami)

export TEAM_NAME='teebeedee'

export LD_LIBRARY_PATH=${CUDNN_HOME}/lib64:${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

export LIBRARY_PATH=${CUDNN_HOME}/lib64:$LIBRARY_PATH

export CPATH=${CUDNN_HOME}/include:$CPATH

export PATH=${CUDA_HOME}/bin:${PATH}

export PYTHON_PATH=$PATH

mkdir -p /disk/scratch/${STUDENT_ID}

export TMPDIR=/disk/scratch/${STUDENT_ID}/
export TMP=/disk/scratch/${STUDENT_ID}/

set -e

mkdir -p /disk/scratch/${TEAM_NAME}/data/shapenet/03001627/
mkdir -p /disk/scratch/${TEAM_NAME}/data/shapenet/status/
rsync -ua --progress /home/${STUDENT_ID}/GenRe-ShapeHD/downloads/data/shapenet/03001627/ /disk/scratch/${TEAM_NAME}/data/shapenet/03001627/
rsync -ua --progress /home/${STUDENT_ID}/GenRe-ShapeHD/downloads/data/shapenet/status/ /disk/scratch/${TEAM_NAME}/data/shapenet/status/
