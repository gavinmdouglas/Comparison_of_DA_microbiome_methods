#!/bin/bash

source ../../Config.sh

mkdir $DATA_DIR/Studies/ArcticFreshwaters/False_Discovery_Testing/results_nonfilt_ext

for i in {1..90}
do
mkdir $DATA_DIR/Studies/ArcticFreshwaters/False_Discovery_Testing/results_nonfilt_ext/$i
done



parallel -j 45 "./run_all_tools.sh -A $DATA_DIR/Studies/ArcticFreshwaters/ArcticFreshwaters_ASVs_table.tsv -G {1} -R $DATA_DIR/Studies/ArcticFreshwaters/ArcticFreshwaters_ASVs_table_rare.tsv -O $DATA_DIR/Studies/ArcticFreshwaters/False_Discovery_Testing/results_nonfilt_ext/{#} --ALDEX_SKIP T --CORNCOB_SKIP T --ANCOM_SKIP T" ::: $DATA_DIR/Studies/ArcticFreshwaters/False_Discovery_Testing/nonfilt_tabs/*.tsvext
