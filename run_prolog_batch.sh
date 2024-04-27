#!/bin/zsh

base_dir="gpt4_prolog"

output_file="prolog_results.txt"
: > "$output_file"  # Clear the output file at the start

index=1
while IFS= read -r line; do
    query="${line#*?- }"
    query="${query%.}"
    echo $query
    prolog_file="${base_dir}/test${index}_gpt4.pl"
    echo "Running query for $prolog_file"
    
    # Format the query to include conditional output and halting
    formatted_query="($query -> writeln(true); writeln(false)), halt."
    result=$(swipl -s "$prolog_file" -g "$formatted_query" -t halt 2>&1)
    echo "Result: $result"

    if [[ "$result" == *true* ]]; then
        echo "1" >> "$output_file"
    elif [[ "$result" == *false* ]]; then
        echo "0" >> "$output_file"
    else
        echo "1" >> "$output_file"
    fi

    ((index++))
done < "${base_dir}/query"

echo "Results saved to $output_file"
