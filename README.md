# From Length to Speed: A Generic Tree Construction Principle for Speculative Decoding

## Abstract
Speculative decoding is pivotal for accelerating Large Language Model (LLM) inference, yet existing tree-based methods are limited by rigid heuristics that prioritize average acceptance length. 
We argue that this length-centric objective often misaligns with actual wall-clock latency, leading to resource misallocation where fixed budgets fail to capture high-potential nodes or waste computation on inefficient ones.
To address this, we propose a speed-oriented tree construction framework. 
Theoretically, we discard restrictive node homogeneity assumptions to prove that total inference time is a convex function of tree size, revealing a unique optimal operating point.
We introduce the \textbf{Greater-Than (GT) Principle}, which dynamically constructs trees by selecting nodes strictly based on positive net latency benefits. 
Extensive empirical evaluation confirms that our method consistently outperforms state-of-the-art baselines across diverse model architectures. 
Our approach achieves peak wall-clock speedups of up to 4.00$\times$, delivering a substantial relative improvement of 17\% (an absolute gain of +0.58$\times$) over the strongest existing methods on Llama3-70B.

![fig](./fig/fig-1.pdf)

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




