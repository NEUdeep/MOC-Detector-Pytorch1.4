cd src
PATH_TO_RGB_MODEL=$1
PATH_TO_FLOW_MODEL=$2
INFERENCE_DIR=$3

python det.py --task stream --K 7 --gpus 0 --batch_size 1 --master_batch 1 --num_workers 0 --rgb_model ../experiment/result_model/$PATH_TO_RGB_MODEL --flow_model ../experiment/result_model/$PATH_TO_FLOW_MODEL --inference_dir $INFERENCE_DIR --flip_test --ninput 5 --dataset hmdb --split 1 --hm_fusion_rgb 0.4

python ACT.py --task frameAP --K 7 --th 0.5 --inference_dir $INFERENCE_DIR --dataset hmdb --split 1

python ACT.py --task BuildTubes --K 7 --inference_dir $INFERENCE_DIR --dataset hmdb --split 1

python ACT.py --task videoAP --K 7 --th 0.2 --inference_dir $INFERENCE_DIR --dataset hmdb --split 1
python ACT.py --task videoAP --K 7 --th 0.5 --inference_dir $INFERENCE_DIR --dataset hmdb --split 1
python ACT.py --task videoAP --K 7 --th 0.75 --inference_dir $INFERENCE_DIR --dataset hmdb --split 1
python ACT.py --task videoAP_all --K 7 --inference_dir $INFERENCE_DIR --dataset hmdb --split 1


cd ..
