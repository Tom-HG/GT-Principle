# From Length to Speed: A Generic Tree Construction Principle for Speculative Decoding

## Abstract
Tree-based speculative decoding has emerged as a leading strategy for accelerating Large Language Model (LLM) inference.
However, existing methods erroneously rely on acceptance length as a proxy for speedup, rather than directly optimizing for wall-clock time.
This misalignment causes inefficient resource allocation, where nodes with low acceptance probability consume budget while high-probability candidates are excluded.
To address this, we theoretically prove that inference latency is strictly convex with respect to tree size, revealing a unique global optimum. 
Leveraging this property, we introduce the Greater-Than (GT) Principle. 
This dynamic framework constructs trees by including nodes if and only if they yield a net latency reduction. 
Extensive experiments show that our method consistently outperforms state-of-the-art baselines, achieving up to 4.00$\times$ speedups and a 17\% relative throughput improvement.




## Install

```
conda create -n gt python=3.11
conda activate gt
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install -r requirements.txt
```

## Datasets

The datasets are in Spec-bench/data/spec_bench/question.jsonl and EAGLE/eagle/data which includes six different subtasks: multi-round conversations, translation, summarization, question answering, mathematical reasoning, and retrieval enhancement generation. These correspond to the datasets MT-bench, WMT14 DE-EN, CNN/Daily Mail, Natural Questions, GSM8K, and DPR, respectively.

## Tree construction

The Dynamic tree optimization (GT) code is in EAGLE/eagle/model/cents.py "topK_genrate_gt()".

## Usage

For vicuna series models:
```
cd Spec-bench
bash 7b_eval.sh
bash 13b_eval.sh
bash 33b_eval.sh
```

For Qwen and Llama3 series models:
```
cd EAGLE
bash llama3_eval.sh
bash qwen3_eval.sh
```

## Result
Changing the speed.py file with tokenizer, jsonl_file and jsonl_file_base.
```
python spped.py
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

SEQUOIA: https://github.com/Infini-AI-Lab/Sequoia

MEDUSA: https://github.com/FasterDecoding/Medusa?tab=readme-ov-file#medusa-1

HYDRA: https://github.com/zankner/hydra?tab=readme-ov-file#model-weights

## Acknowledgments
This codebase is built from [Spec-bench](https://github.com/hemingkx/Spec-Bench/blob/main/Readme.md), [Sequoia](https://github.com/Infini-AI-Lab/Sequoia), [EAGLE](https://github.com/SafeAILab/EAGLE), [Medusa](https://github.com/FasterDecoding/Medusa).





