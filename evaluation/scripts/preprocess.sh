for PROMPT_ID in {1..5}
do
echo KoBBQ_all $PROMPT_ID
python3 ../1_preprocess.py \
    --samples-tsv-path ../../data/KoBBQ_all_samples.tsv \
    --evaluation-tsv-path ../data/KoBBQ_all/KoBBQ_all_evaluation_$PROMPT_ID.tsv \
    --evaluation-json-path ../data/KoBBQ_all/KoBBQ_all_evaluation_$PROMPT_ID.json \
    --prompt-tsv-path ../0_evaluation_prompts.tsv \
    --prompt-id $PROMPT_ID
done