#!/bin/bash
path=$1
files=$(ls ${path})
filename=result_$2
mkdir /home/dengzeshuai/code/EDSR-PyTorch-CLW/experiment/${filename}
for f in ${files}
do
    echo ${f}
    CUDA_VISIBLE_DEVICES=0,1,2,3 python main.py --dir_demo /home/dengzeshuai/code/EDSR-PyTorch-CLW/src/data/SDR_540p/${f} --data_test video --n_GPUs 4 --model $2 --scale 4 --pre_train /home/dengzeshuai/pretrained_models/RCAN_BIX4_G10R20P48/model/model_best.pt --reset --test_only --save video_try_RCASN_4
    cp /home/dengzeshuai/code/EDSR-PyTorch-CLW/experiment/video_try_RDN_4/*.avi /home/dengzeshuai/code/EDSR-PyTorch-CLW/experiment/${filename}
done
