#!/bin/bash

#MODEL_PATHS=("google/mt5-small" "google/mt5-base" "google/mt5-large" "google/mt5-xl" "/storage/public/t5_sl_small-pytorch/" "/storage/public/t5_sl_large-pytorch/")
#MODEL_SHORTHANDS=("mt5-small" "mt5-base" "mt5-large" "mt5-large mt5-xl" "t5-sl-small" "t5-sl-large")

TRAIN_FILE="ucna.json"
VALIDATION_FILE="evalvacijska.json"
TEST_FILE="testna.json"
MAX_SOURCE_LENGTH=512
MAX_TARGET_LENGTH=128
PER_DEVICE_TRAIN_BATCH_SIZE=2
PER_DEVICE_EVAL_BATCH_SIZE=2
GRADIENT_ACCUMULATION=8
NUM_TRAIN_EPOCHS=64
BEAMS=1
OUTPUT_DIR="results"
MODEL_NAME_OR_PATH="cjvt/t5-sl-small"


python transformers/examples/pytorch/summarization/run_summarization.py\
 --model_name_or_path $MODEL_NAME_OR_PATH \
 --no_use_fast_tokenizer \
 --train_file $TRAIN_FILE \
 --validation_file $VALIDATION_FILE \
 --test_file $TEST_FILE \
 --text_column "kompleksni" \
 --summary_column "enostavni" \
 --max_source_length $MAX_SOURCE_LENGTH \
 --max_target_length $MAX_TARGET_LENGTH \
 --output_dir $OUTPUT_DIR \
 --do_train --do_eval --do_predict \
 --per_device_train_batch_size $PER_DEVICE_TRAIN_BATCH_SIZE \
 --per_device_eval_batch_size $PER_DEVICE_EVAL_BATCH_SIZE \
 --num_train_epochs $NUM_TRAIN_EPOCHS \
 --num_beams $BEAMS \
 --save_strategy epoch \
 --evaluation_strategy epoch \
 --seed 42 \
 --generation_max_length $MAX_TARGET_LENGTH \
 --gradient_accumulation_steps $GRADIENT_ACCUMULATION \
 --predict_with_generate\
 --load_best_model_at_end \
 --metric_for_best_model "eval_rougeL" \
 --greater_is_better=True \
 --save_total_limit=1 \
bert-score -r kompleksni.txt enostavni.txt -c $OUTPUT_DIR/generated_predictions.txt --lang sl
for layers in 1 2 4 8 12
do
        bert-score -r kompleksni.txt enostavni.txt -c $OUTPUT_DIR/generated_predictions.txt --model EMBEDDIA/sloberta --num_layers $layers >> results_bert-score_sloberta.num_layers_${layers}_Test.txt
done
