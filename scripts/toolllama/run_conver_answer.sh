cd ../../toolbench/tooleval
export RAW_ANSWER_PATH=../../data/answer
export CONVERTED_ANSWER_PATH=../../data/model_predictions_converted
export MODEL_NAME=virtual_toolllama_vllm_dfs_tem0.2
export test_set=G2_category

mkdir -p ${CONVERTED_ANSWER_PATH}/${MODEL_NAME}
answer_dir=${RAW_ANSWER_PATH}/${MODEL_NAME}/${test_set}
output_file=${CONVERTED_ANSWER_PATH}/${MODEL_NAME}/${test_set}.json

python convert_to_answer_format.py\
    --answer_dir ${answer_dir} \
    --method DFS_woFilter_w2 \
    --output ${output_file}