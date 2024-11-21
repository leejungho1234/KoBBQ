for PROMPT_ID in {1..5}
do
python3 ../2_model_inference.py \
    --data-path ../data/KoBBQ_all/KoBBQ_all_evaluation_$PROMPT_ID.json \
    --output-dir ../outputs/raw/KoBBQ_all_$PROMPT_ID \
    --model-name EXAONE-3-INST \
    --batch-size 4
done