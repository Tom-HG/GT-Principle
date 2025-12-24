# CUDA_VISIBLE_DEVICES=3,4,5,6 nsys profile -o my_report --force-overwrite true python -m eagle.evaluation.gen_ea_answer_qwen3 \
#                                     --ea-model-path /home/share_data/models/Qwen3-8B_eagle3 \
#                                     --base-model-path /home/share_data/models/Qwen3-8B \
#                                     --model-id gt-qwen3-8b-fp16 \
#                                     --use-eagle3

# CUDA_VISIBLE_DEVICES=4,5 python -m eagle.evaluation.gen_ea_answer_qwen3 \
#                                     --ea-model-path /home/share_data/models/Qwen3-8B_eagle3 \
#                                     --base-model-path /home/share_data/models/Qwen3-8B \
#                                     --model-id gt-qwen3-8b-fp16 \
#                                     --use-eagle3 \
#                                     --question-begin 0 \
#                                     --question-end 80 \
#                                     --temperature 0.0 \
#                                     --top-k 10 \
#                                     --bench-name translation \
#                                     --use-gt

# CUDA_VISIBLE_DEVICES=4,5 python -m eagle.evaluation.gen_ea_answer_qwen3 \
#                                     --ea-model-path /home/share_data/models/Qwen3-8B_eagle3 \
#                                     --base-model-path /home/share_data/models/Qwen3-8B \
#                                     --model-id ess-qwen3-8b-fp16 \
#                                     --use-eagle3 \
#                                     --question-begin 0 \
#                                     --question-end 80 \
#                                     --temperature 0.0 \
#                                     --bench-name translation \

# CUDA_VISIBLE_DEVICES=4,5 python -m eagle.evaluation.gen_baseline_answer_qwen3 \
#                                     --ea-model-path /home/share_data/models/Qwen3-8B_eagle3 \
#                                     --base-model-path /home/share_data/models/Qwen3-8B \
#                                     --model-id baseline-qwen3-8b-fp16 \
#                                     --question-begin 0 \
#                                     --question-end 80 \
#                                     --temperature 0.0 \
#                                     --bench-name translation


CUDA_VISIBLE_DEVICES=3,4,5,6 python -m eagle.evaluation.gen_ea_answer_qwen3 \
                                    --ea-model-path /home/share_data/models/Qwen3-32B_eagle3 \
                                    --base-model-path /home/share_data/models/Qwen3-32B \
                                    --model-id gt-qwen3-32b-fp16 \
                                    --use-eagle3 \
                                    --question-begin 0 \
                                    --question-end 80 \
                                    --temperature 0.0 \
                                    --top-k 10 \
                                    --bench-name sum \
                                    --use-gt \
                                    > records.log 2>&1

CUDA_VISIBLE_DEVICES=3,4,5,6 python -m eagle.evaluation.gen_ea_answer_qwen3 \
                                    --ea-model-path /home/share_data/models/Qwen3-32B_eagle3 \
                                    --base-model-path /home/share_data/models/Qwen3-32B \
                                    --model-id ess-qwen3-32b-fp16 \
                                    --use-eagle3 \
                                    --question-begin 0 \
                                    --question-end 80 \
                                    --temperature 0.0 \
                                    --bench-name sum \
                                    >> records.log 2>&1

CUDA_VISIBLE_DEVICES=3,4,5,6 python -m eagle.evaluation.gen_baseline_answer_qwen3 \
                                    --ea-model-path /home/share_data/models/Qwen3-32B_eagle3 \
                                    --base-model-path /home/share_data/models/Qwen3-32B \
                                    --model-id baseline-qwen3-32b-fp16 \
                                    --question-begin 0 \
                                    --question-end 80 \
                                    --temperature 0.0 \
                                    --bench-name sum \
                                    >> records.log 2>&1