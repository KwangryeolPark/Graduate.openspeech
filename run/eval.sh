#!/bin/bash
# export BASE_PATH=/home/pkr7098/Data/Korean_voice
# export DATASET_PATH="$BASE_PATH/KsponSpeech"
# export TEST_DATASET_PATH="$BASE_PATH/KsponSpeech_eval"
# export TEST_MANIFEST_DIR="$BASE_PATH/KsponSpeech_scripts"
export DATASET_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/val/source/cranial_nerve_disorder_01
export CHECKPOINT_PATH=/home/pkr7098/python/Graduate.openspeech/outputs/2023-05-31/11-53-12/listen_attend_spell-ksponspeech/weo277oy/checkpoints/epoch_99-step_59600.ckpt
export MANIFEST_FILE_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/val/manifest/cranial_nerve_disorder_01/integrated/manifest_reduced.trn
export VOCAB_FILE_PATH=/home/pkr7098/python/Graduate.openspeech/kspon.csv
export RESULT=`date +%Y-%m-%d_%H-%M-%S`
export RESULT_PATH=/home/pkr7098/python/Graduate.openspeech/result/$RESULT.txt
# python3 ./openspeech_cli/hydra_eval.py \
#     audio=melspectrogram \
#     eval.dataset_path=$DATASET_PATH \
#     eval.checkpoint_path="/home/pkr7098/python/Graduate.openspeech/outputs/2023-05-30/00-21-28/listen_attend_spell-ksponspeech/edksgp9y/checkpoints/epoch=19-step=7500.ckpt" \
#     model=listen_attend_spell \
#     tokenizer=kspon_character \
#     eval.manifest_file_path=$TEST_DATASET_PATH \
#     tokenizer.vocab_path="../kspon.csv" \
python3 ./openspeech_cli/hydra_eval.py \
    audio=melspectrogram \
    eval.dataset_path=$DATASET_PATH \
    eval.checkpoint_path=$CHECKPOINT_PATH \
    eval.manifest_file_path=$MANIFEST_FILE_PATH \
    model=listen_attend_spell \
    tokenizer=kspon_character \
    tokenizer.vocab_path=$VOCAB_FILE_PATH \
    eval.result_path=$RESULT_PATH \
    eval.batch_size=1 \