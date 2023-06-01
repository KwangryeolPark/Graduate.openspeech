#/bin/bash
# export DATASET_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/val/source/cranial_nerve_disorder_01
# export TEST_DATASET_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/val/source/cranial_nerve_disorder_01
# export MANIFEST_FILE_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/val/manifest/cranial_nerve_disorder_01/integrated/manifest_reduced.trn


# python3 ./openspeech_cli/hydra_train.py \
#     dataset=ksponspeech \
#     dataset.manifest_file_path=$MANIFEST_FILE_PATH \
#     tokenizer=kspon_character \
#     model=listen_attend_spell \
#     audio=melspectrogram \
#     lr_scheduler=warmup_reduce_lr_on_plateau \
#     trainer=gpu \
#     criterion=cross_entropy \
#     dataset.dataset_path=$DATASET_PATH \
#     dataset.test_dataset_path=$TEST_DATASET_PATH \
#     trainer.batch_size=1 \
#     trainer.max_epochs=100 \
#     audio.sample_rate=48000 \






export DATASET_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/splited
export TEST_DATASET_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/splited
export MANIFEST_FILE_PATH=/home/pkr7098/Data/dysarthria_voice_recognition_data/splited/manifest.trn
export VOCAB_PATH=/home/pkr7098/python/Graduate.openspeech/kspon.csv

python3 ./openspeech_cli/hydra_train.py \
    dataset=ksponspeech \
    dataset.manifest_file_path=$MANIFEST_FILE_PATH \
    dataset.test_manifest_dir=$MANIFEST_FILE_PATH \
    dataset.dataset_path=$DATASET_PATH \
    dataset.test_dataset_path=$TEST_DATASET_PATH \
    tokenizer.vocab_path=$VOCAB_PATH \
    tokenizer=kspon_character \
    model=listen_attend_spell \
    audio=melspectrogram \
    lr_scheduler=warmup_reduce_lr_on_plateau \
    trainer=gpu \
    criterion=cross_entropy \
    trainer.batch_size=256 \
    trainer.max_epochs=100 \
    audio.sample_rate=48000 \
