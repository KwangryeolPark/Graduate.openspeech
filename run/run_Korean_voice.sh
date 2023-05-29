#/bin/bash

export MANIFEST_FILE_PATH=/home/pkr7098/Data/Korean_voice/KsponSpeech_scripts/train.trn
python3 ./openspeech_cli/hydra_train.py \
    dataset=ksponspeech \
    dataset.dataset_path=$DATASET_PATH \
    dataset.test_dataset_path=$TEST_DATASET_PATH \
    dataset.test_manifest_dir=$TEST_MANIFEST_DIR \
    tokenizer=kspon_character \
    model=listen_attend_spell \
    audio=melspectrogram \
    lr_scheduler=warmup_reduce_lr_on_plateau \
    trainer=gpu \
    criterion=cross_entropy

# python3 ./openspeech_cli/hydra_train.py \
#     dataset=ksponspeech \
#     dataset.dataset_path=$DATASET_PATH \
#     dataset.manifest_file_path=$MANIFEST_FILE_PATH \
#     dataset.test_dataset_path=$TEST_DATASET_PATH \
#     dataset.test_manifest_dir=$TEST_MANIFEST_DIR \
#     tokenizer=kspon_character \
#     model=listen_attend_spell \
#     audio=melspectrogram \
#     lr_scheduler=warmup_reduce_lr_on_plateau \
#     trainer=gpu \
#     criterion=cross_entropy
