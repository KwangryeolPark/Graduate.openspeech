#/bin/bash
# export BASE_PATH=/home/pkr7098/Data/Korean_voice
# export DATASET_PATH="$BASE_PATH/KsponSpeech"
export DATASET_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/val/source/cranial_nerve_disorder_01
export TEST_DATASET_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/val/source/cranial_nerve_disorder_01
# export TEST_DATASET_PATH="$BASE_PATH/KsponSpeech_eval"
# export TEST_MANIFEST_DIR="$BASE_PATH/KsponSpeech_scripts"
export MANIFEST_FILE_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/val/manifest/cranial_nerve_disorder_01/integrated/manifest.trn
# export CHECKPOINT_PATH="./ckpt"


python3 ./openspeech_cli/hydra_train.py \
    dataset=ksponspeech \
    dataset.manifest_file_path=$MANIFEST_FILE_PATH \
    tokenizer=kspon_character \
    model=listen_attend_spell \
    audio=melspectrogram \
    lr_scheduler=warmup_reduce_lr_on_plateau \
    trainer=gpu \
    criterion=cross_entropy \
    dataset.dataset_path=$DATASET_PATH \
    dataset.test_dataset_path=$TEST_DATASET_PATH \
# dataset.test_manifest_dir=$TEST_MANIFEST_DIR \
