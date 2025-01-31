# Revisiting Speculative Sampling: A Generic Tree Construction Principle for LLM Inference Acceleration.
This repository implements Revisiting Speculative Sampling: A Generic Tree Construction Principle for LLM Inference Acceleration.
------



## Install

```
pip install -r requirements.txt
```

## Datasets

The datasets are in data/spec_bench/question.jsonl which includes six different subtasks: multi-round conversations, translation, summarization, question answering, mathematical reasoning, and retrieval enhancement generation. These correspond to the datasets MT-bench, WMT14 DE-EN, CNN/Daily Mail, Natural Questions, GSM8K, and DPR, respectively.

## Tree construction

The Dynamic tree optimization (EAGLE-2+GE) code is in model/eagle2/cents.py "topK_genrate_new()".

The Static tree optimization (EAGLE+GE) in model/eagle/choicea.py.

## Usage

```
bash 7b_eval.sh
bash 13b_eval.sh
bash 33b_eval.sh
```

## Hugging face model
The base models used in expriment are from hugging face, so use the following code to download the models to your own path.
```
model_path = 'vicuna-7b-v1.3'
model = AutoModelForCausalLM.from_pretrained(model_path, output_hidden_states=True)
tokenizer = AutoTokenizer.from_pretrained(model_path)
```
## Draft model

It can be downloaded at https://github.com/hemingkx/Spec-Bench.

VICUNA: https://huggingface.co/lmsys/vicuna-7b-v1.3

EAGLE: https://github.com/SafeAILab/EAGLE?tab=readme-ov-file#eagle-weights

MEDUSA: https://github.com/FasterDecoding/Medusa?tab=readme-ov-file#medusa-1

HYDRA: https://github.com/zankner/hydra?tab=readme-ov-file#model-weights

