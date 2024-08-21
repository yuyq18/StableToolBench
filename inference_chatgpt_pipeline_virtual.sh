export CONFIG_FILE="config.yml"
export PYTHONPATH=./
# unset HTTP_PROXY HTTPS_PROXY http_proxy https_proxy
# export GPT_MODEL="gpt-3.5-turbo-0125"
export GPT_MODEL="gpt-4-turbo-2024-04-09"
export SERVICE_URL="http://localhost:8081/virtual"

export OUTPUT_DIR="data/answer/virtual_chatgpt_cot"
group=G1_instruction
mkdir -p $OUTPUT_DIR; mkdir -p $OUTPUT_DIR/$group
python toolbench/inference/qa_pipeline_multithread.py \
    --backbone_model chatgpt_function \
    --chatgpt_model $GPT_MODEL \
    --config_file $CONFIG_FILE \
    --max_observation_length 1024 \
    --method CoT@1 \
    --input_query_file solvable_queries/test_instruction/${group}.json \
    --output_answer_file $OUTPUT_DIR/$group \
    --num_thread 1 --overwrite