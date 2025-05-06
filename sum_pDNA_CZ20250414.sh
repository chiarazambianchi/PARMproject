for file in *txt.gz; do
    echo "Processing ${file}"
    
    # Create a temporary file to store the output
    tmp_file=$(mktemp)

    # Process the file: add the sum of columns 17 and 18 as a new column
    zcat "$file" | awk 'BEGIN { FS = OFS = "\t" }   # Set input and output field separator as tab
                            NR == 1 { print $0, "pDNA_T1_T2_sum"; next }   # Print header line and add new column header
                           { sum = $(NF-1) + $NF; print $0, sum }   # Calculate sum of last and second to last column, print entire line with sum
                            ' > "$tmp_file"

    # Compress the processed file and overwrite the original file
    gzip -c "$tmp_file" > "$file"
    
    # Remove the temporary file
    rm "$tmp_file"
    
done