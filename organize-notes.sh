#!/bin/bash

input_directory=/home/sam/notes
output_directory=/home/sam/notes-pdf

date_file=/home/sam/.notes_date_file.txt

# recursive function to convert all markdown files to pdf
# and recurse on all sub directories
convert_folder() {
    # operate on the files in this directory
    # get matching path in the output directory
    output_path=$(pwd)
    output_path=${output_path#${input_directory}}
    output_path="${output_directory}${output_path}"

    # make the directory if it does not exist yet
    mkdir -p $output_path

    # convert and move all markdown files
    for file in *.md ; do
        if [ $file != "*.md" ] ; then
            # if file was modified since last update
            if [ "$file" -nt "$date_file" ]; then
                # get file destination and make pdf
                pdf_file="${file%".md"}.pdf"
                # delete previous version
                rm "${output_path}/${pdf_file}" || true     # the or true just avoids errors if the file does not exist
                pandoc $file -o "${output_path}/${pdf_file}"
                echo "Creating $pdf_file"
            fi
        fi
    done

    # recurse on each sub directory
    for dir in */ ; do
        if [ $dir != "*/" ] ; then
            cd $dir
            convert_folder
            cd ..
        fi
    done
}

cd $input_directory
convert_folder

# update the last saved date
echo "hey" > $date_file
