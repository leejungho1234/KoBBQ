'''
KoBBQ
Copyright (c) 2024-present NAVER Cloud Corp.
MIT license
'''

import torch
from tqdm.auto import tqdm
from transformers import pipeline, AutoTokenizer

KOALPACA_MODEL = ['EXAONE-3-INST']
KOALPACA_MODEL_PATH = {'EXAONE-3-INST':'LGAI-EXAONE/EXAONE-3.0-7.8B-Instruct'}

def load_koalpaca(model_name='EXAONE-3-INST'):
    tokenizer = AutoTokenizer.from_pretrained(KOALPACA_MODEL_PATH[model_name])
    pipe = pipeline(
        'text-generation', 
        torch_dtype=torch.bfloat16, 
        model=KOALPACA_MODEL_PATH[model_name], 
        tokenizer=tokenizer,
        device_map="auto", 
        trust_remote_code=True)
    # pipe.model.config.pad_token_id = pipe.model.config.eos_token_id
    # pipe.tokenizer.padding_side = 'right'
    return pipe

def get_koalpaca_response(
    prompt,
    model_name,
    pipe,
    max_tokens,
    batch_size
):
    assert model_name in KOALPACA_MODEL
    prompt = [[{'role':'user', 'content':p}] for p in prompt]
    result = []
    
    try:
        for idx, out in enumerate(tqdm(pipe(prompt, batch_size=batch_size, max_new_tokens=max_tokens), total=len(prompt))):
            raw = out[0]['generated_text'][0]
            
            result.append(raw['content'][-1])
    except Exception as e:
        print(e)
    return result