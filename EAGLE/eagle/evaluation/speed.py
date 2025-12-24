import json
from transformers import AutoTokenizer
import numpy as np

# bench_name = ""
tokenizer=AutoTokenizer.from_pretrained("/home/share_data/models/Meta-Llama-3.1-8B-Instruct")
jsonl_file = "/home/huangguang/EAGLE/sum/gt-llama31-8b-fp16-temperature-0.0.jsonl"
jsonl_file_base = "/home/huangguang/EAGLE/sum/baseline-llama31-8b-fp16-temperature-0.0.jsonl"
data = []
with open(jsonl_file, 'r', encoding='utf-8') as file:
    for line in file:
        json_obj = json.loads(line)
        data.append(json_obj)


speeds=[]
ids_list=[]
for datapoint in data:
    qid=datapoint["question_id"]
    answer=datapoint["choices"][0]['turns']
    tokens=sum(datapoint["choices"][0]['new_tokens'])
    times = sum(datapoint["choices"][0]['wall_time'])
    ids = sum(datapoint["choices"][0]['idxs'])
    speeds.append(tokens/times)
    ids_list.append(tokens/ids)

total_ids=sum(ids_list)
print("alpha",np.array(ids_list).mean())



data = []
with open(jsonl_file_base, 'r', encoding='utf-8') as file:
    for line in file:
        json_obj = json.loads(line)
        data.append(json_obj)


total_time=0
total_token=0
speeds0=[]
for datapoint in data:
    qid=datapoint["question_id"]
    answer=datapoint["choices"][0]['turns']
    tokens = 0
    for i in answer:
        tokens += (len(tokenizer(i).input_ids) - 1)
    times = sum(datapoint["choices"][0]['wall_time'])
    speeds0.append(tokens / times)
    total_time+=times
    total_token+=tokens



# print('speed',np.array(speeds).mean())
# print('speed0',np.array(speeds0).mean())
print("ratio",np.array(speeds).mean()/np.array(speeds0).mean())


