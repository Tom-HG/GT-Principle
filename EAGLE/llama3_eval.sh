# CUDA_VISIBLE_DEVICES=2 python -m eagle.evaluation.gen_ea_answer_llama3chat \
#                                                 --ea-model-path /home/share_data/models/sglang-EAGLE3-LLaMA3.1-Instruct-8B \
#                                                 --base-model-path  /home/share_data/models/Meta-Llama-3.1-8B-Instruct \
#                                                 --model-id gt-llama3-8b-fp16 \
#                                                 --use_eagle3 \
#                                                 --question-end 80

CUDA_VISIBLE_DEVICES=3,4 python -m eagle.evaluation.gen_ea_answer_llama3chat \
                                    --ea-model-path /home/share_data/models/sglang-EAGLE3-LLaMA3.1-Instruct-8B \
                                    --base-model-path  /home/share_data/models/Meta-Llama-3.1-8B-Instruct \
                                    --model-id gt-llama31-8b-fp16 \
                                    --use_eagle3 \
                                    --question-begin 0 \
                                    --question-end 80 \
                                    --temperature 0.0 \
                                    --top-k 10 \
                                    --bench-name sum \
                                    --use_gt \
                                    > records.log 2>&1

CUDA_VISIBLE_DEVICES=3,4 python -m eagle.evaluation.gen_ea_answer_llama3chat \
                                    --ea-model-path /home/share_data/models/sglang-EAGLE3-LLaMA3.1-Instruct-8B \
                                    --base-model-path  /home/share_data/models/Meta-Llama-3.1-8B-Instruct \
                                    --model-id ess-llama31-8b-fp16 \
                                    --use_eagle3 \
                                    --question-begin 0 \
                                    --question-end 80 \
                                    --temperature 0.0 \
                                    --bench-name sum \
                                    >> records.log 2>&1
                                    

CUDA_VISIBLE_DEVICES=3,4 python -m eagle.evaluation.gen_baseline_answer_llama3chat \
                                    --ea-model-path /home/share_data/models/sglang-EAGLE3-LLaMA3.1-Instruct-8B \
                                    --base-model-path  /home/share_data/models/Meta-Llama-3.1-8B-Instruct \
                                    --model-id baseline-llama31-8b-fp16 \
                                    --question-begin 0 \
                                    --question-end 80 \
                                    --temperature 0.0 \
                                    --bench-name sum \
                                    >> records.log 2>&1