#!/bin/bash

source ../../Config.sh
echo $DATA_DIR

find "$DATA_DIR/Testing_Bias_robustness/Diarrhea" -maxdepth 1 -mindepth 1 -type d | while read dir;
	do mkdir $dir/Genus_filt;
done

parallel -j 5 -N4 "./run_all_tools.sh -A $DATA_DIR{1} -G $DATA_DIR{2} -O $DATA_DIR{3} -D {4} -F 0.1" :::: <(cat input_parameters/Diarrhea/filt_input/sort_combined.txt)
