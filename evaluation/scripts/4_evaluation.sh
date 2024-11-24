MODELS='EXAONE-3-INST'

for PROMPT_ID in {1..5}
do
python3 ../5_evaluation.py \
    --evaluation-result-path ../evaluation_result/KoBBQ_all_$PROMPT_ID.tsv \
    --model-result-tsv-dir ../outputs/processed/KoBBQ_all_$PROMPT_ID \
    --topic KoBBQ_all_evaluation \
    --test-or-all all \
    --prompt-tsv-path ../0_evaluation_prompts.tsv \
    --prompt-id $PROMPT_ID \
    --models $MODELS
done