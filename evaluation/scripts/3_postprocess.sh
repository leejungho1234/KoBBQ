MODELS='EXAONE-3-INST'

for MODEL in $MODELS
do
    for PROMPT_ID in {1..5}
    do
    echo KoBBQ_test $PROMPT_ID $MODEL
    python3 ../3_postprocess_predictions.py \
        --predictions-tsv-path ../outputs/raw/KoBBQ_all_$PROMPT_ID/KoBBQ_all_evaluation_$PROMPT_ID\_$MODEL\_predictions.tsv \
        --preprocessed-tsv-path ../data/KoBBQ_all/KoBBQ_all_evaluation_$PROMPT_ID.tsv
    python3 ../4_predictions_to_evaluation.py \
        --predictions-tsv-path ../outputs/raw/KoBBQ_all_$PROMPT_ID/KoBBQ_all_evaluation_$PROMPT_ID\_$MODEL\_predictions.tsv \
        --preprocessed-tsv-path ../data/KoBBQ_all/KoBBQ_all_evaluation_$PROMPT_ID.tsv \
        --output-path ../outputs/processed/KoBBQ_all_$PROMPT_ID/KoBBQ_all_evaluation_$PROMPT_ID\_$MODEL.tsv
    done
done