#!/bin/bash

source ../../Config.sh

mkdir $DATA_DIR/Studies/ob_goodrich/False_Discovery_Testing/results_nonfilt
for i in {1..10}
do
mkdir $DATA_DIR/Studies/ob_goodrich/False_Discovery_Testing/results_nonfilt/$i
done


parallel -j 5 "./run_all_tools.sh -A $DATA_DIR/Studies/ob_goodrich/ob_goodrich_ASVs_table.tsv -G {1} -R $DATA_DIR/Studies/ob_goodrich/ob_goodrich_ASVs_table_rare.tsv -O $DATA_DIR/Studies/ob_goodrich/False_Discovery_Testing/results_nonfilt/{#}" ::: $DATA_DIR/Studies/ob_goodrich/False_Discovery_Testing/nonfilt_tabs/*.tsv
