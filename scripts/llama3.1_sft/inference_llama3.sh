cd ../..
export PYTHONPATH=./
# export GPT_MODEL="gpt-3.5-turbo-16k"
export VLLM_API_BASE="http://127.0.0.1:8086/v1/"
export SERVICE_URL="http://localhost:8081/virtual"
# export OUTPUT_DIR="data/answer/virtual_llama3.1_sft_dfs_test_ckpts2800"
export OUTPUT_DIR="data/answer/virtual_llama3.1_sft_dfs_fix_ckpts4000"
export CUDA_VISIBLE_DEVICES="0,1"
export CURL_CA_BUNDLE=""
export REQUESTS_CA_BUNDLE=""

group=G3_instruction
mkdir -p $OUTPUT_DIR; mkdir -p $OUTPUT_DIR/$group
python toolbench/inference/qa_pipeline_multithread.py \
    --backbone_model llama3 \
    --model_path sft-fix \
    --max_observation_length 1024 \
    --method DFS_woFilter_w2 \
    --input_query_file solvable_queries/test_instruction/${group}.json \
    --output_answer_file $OUTPUT_DIR/$group \
    --num_thread 4 &&

group=G1_category
mkdir -p $OUTPUT_DIR; mkdir -p $OUTPUT_DIR/$group
python toolbench/inference/qa_pipeline_multithread.py \
    --backbone_model llama3 \
    --model_path sft-fix \
    --max_observation_length 1024 \
    --method DFS_woFilter_w2 \
    --input_query_file solvable_queries/test_instruction/${group}.json \
    --output_answer_file $OUTPUT_DIR/$group \
    --num_thread 4 &&

group=G1_tool
mkdir -p $OUTPUT_DIR; mkdir -p $OUTPUT_DIR/$group
python toolbench/inference/qa_pipeline_multithread.py \
    --backbone_model llama3 \
    --model_path sft-fix \
    --max_observation_length 1024 \
    --method DFS_woFilter_w2 \
    --input_query_file solvable_queries/test_instruction/${group}.json \
    --output_answer_file $OUTPUT_DIR/$group \
    --num_thread 4