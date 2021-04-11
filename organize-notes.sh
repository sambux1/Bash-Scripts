#!/bin/bash

input_directory=/home/sam/notes
output_directory=/home/sam/notes-pdf

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
            pdf_file="${file%".md"}.pdf"
            pandoc $file -o "${output_path}/${pdf_file}"
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

# deletes folder so it can be regenerated
rm -r $output_directory

cd $input_directory
convert_folder
