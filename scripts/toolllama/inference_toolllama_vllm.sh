cd ../..
export PYTHONPATH=./
# export GPT_MODEL="gpt-3.5-turbo-16k"
export SERVICE_URL="http://127.0.0.1:8081/virtual"
export OUTPUT_DIR="data/answer/virtual_toolllama_vllm_cot"
export CUDA_VISIBLE_DEVICES="0,1,2,3"
export CURL_CA_BUNDLE=""

group=G1_instruction
mkdir -p $OUTPUT_DIR; mkdir -p $OUTPUT_DIR/$group
# accelerate launch --num_processes 1 toolbench/inference/qa_pipeline_multithread.py \
python toolbench/inference/qa_pipeline_multithread.py \
    --backbone_model ToolLLaMA_vllm \
    --model_path ToolBench/ToolLLaMA-2-7b-v2 \
    --max_observation_length 1024 \
    --method CoT@1 \
    --input_query_file solvable_queries/test_instruction/${group}.json \
    --output_answer_file $OUTPUT_DIR/$group \
    --num_thread 4