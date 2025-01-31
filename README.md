# GTCP

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

