#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..


# Set the input and output file paths
input_source_file=$base/data/train.nl-de.nl
output_source_file=$base/data/train_token.nl-de.nl

input_target_file=$base/data/train.nl-de.de
output_target_file=$base/data/train_token.nl-de.de

# Defining the number of lines to extract
num_lines=100000

# Defining the path to the moses tokenizer
tokenize_script=$base/tools/moses-scripts/scripts/tokenizer/tokenizer.perl

# Tokenizing the source input file:
tokenized_source_file=${input_source_file}_tokenize
perl $tokenize_script -l nl < $input_source_file > $tokenized_source_file

# Extract number of lines from source file
head -n $num_lines $tokenized_source_file > $output_source_file

# Tokenizing the target input file:
tokenized_target_file=${input_target_file}_tokenize
perl $tokenize_script -l de < $input_target_file > $tokenized_target_file

# Extract number of lines from target file
head -n $num_lines $tokenized_target_file > $output_target_file


# Remove the temporary tokenized files:
rm $tokenized_source_file
rm $tokenized_target_file