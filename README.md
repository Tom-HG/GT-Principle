# Max-Speedup Speculative Sampling: A Generic Tree Construction Principle.

## Abstract
Speculative sampling has emerged as a promising approach to accelerating large language model (LLM) inference by leveraging a lightweight draft model to propose multiple candidate tokens, which are then verified in parallel by a target model. 
Recent methods enhance this process by structuring candidate sequences into a token tree for more efficient verification. 
However, existing tree construction methods overly rely on acceptance length as a proxy for speedup.
Such an indirect pursuit renders it challenging to achieve the optimal tree structure for maximum speedup.
In this paper, we first revisit prior approaches and find they suffer from two key limitations: analytical intractability and the assumption of node independence.
We then redefine the costs and benefits of each tree node, derive a function that characterizes the relationship between time reduction and draft length, and prove its convexity. 
Finally, we extend this analytical framework to tree structures, and propose a general principle for tree construction aimed at maximizing speedup.
Applying this principle to state-of-the-art tree-based speculative sampling methods consistently delivers significant gains, improving overall performance by 4\% to 14\% and achieving end-to-end speedup of 1.97× to 2.68×.

## Install

```
conda create -n maxsps python=3.12
conda activate maxsps
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install -r requirements.txt
```

## Datasets

The datasets are in data/spec_bench/question.jsonl which includes six different subtasks: multi-round conversations, translation, summarization, question answering, mathematical reasoning, and retrieval enhancement generation. These correspond to the datasets MT-bench, WMT14 DE-EN, CNN/Daily Mail, Natural Questions, GSM8K, and DPR, respectively.

## Tree construction

The Dynamic tree optimization (EAGLE-2+GE) code is in model/eagle2/cents.py "topK_genrate_new()".

The Static tree optimization (EAGLE+GE) in model/eagle/choicea.py.

## Usage

For vicuna series models:
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

SEQUOIA: https://github.com/Infini-AI-Lab/Sequoia

MEDUSA: https://github.com/FasterDecoding/Medusa?tab=readme-ov-file#medusa-1

HYDRA: https://github.com/zankner/hydra?tab=readme-ov-file#model-weights

## Acknowledgments
This codebase is built from [Spec-bench](https://github.com/hemingkx/Spec-Bench/blob/main/Readme.md), [Sequoia](https://github.com/Infini-AI-Lab/Sequoia), [EAGLE](https://github.com/SafeAILab/EAGLE), [Medusa](https://github.com/FasterDecoding/Medusa).


