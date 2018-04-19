#!/bin/bash
clear
echo "$(tput setaf 3)**********************************************"
echo "*               MESSAGE FINDER               *"
echo "**********************************************"
# Prompts user for name of mapping file and the
# files to be examined, assuming the file is .txt
read -p "$(tput setaf 3)Enter Name of Mapping File: $(tput setaf 4)" mapFile
read -p "$(tput setaf 3)Enter List of Files: $(tput setaf 4)" files
# creates an array with the file names
declare -a fileList
readarray fileList <<< $files
# sorts the mapping file by the numbers in the last column
echo "$(tput setaf 3)Reading Mapping File..."
sort -k3,3n "$mapFile.txt" > _AUXstmp.txt
echo "Done."
# creates an auxiliary file and appends the lines
# with "error" as well as the line below found in
# the input files
echo "Processing Inputed Files..."
touch _AUXf.txt
for file in $fileList; do
	echo "$(tput setaf 1)$file.txt"
	grep 'error' -A 1 "$file.txt" >> _AUXf.txt
done
echo "$(tput setaf 3)Done."
# deletes the lines with "syntax, server, memory,"
# and the line below, then it deletes the lines that
# contain error
echo "Filtering Undesired lines..."
sed '/syntax/,+1d' -i _AUXf.txt
sed '/server/,+1d' -i _AUXf.txt
sed '/memory/,+1d' -i _AUXf.txt
sed '/error/d' -i _AUXf.txt
echo "Done."
# retrieves all the words of length 2 at the beginning
# of each line in the first filter file 
echo "Filtering Keys..." 
grep -o -w -E '^[a-z]{2}' _AUXf.txt > _AUXf2.txt
echo "Done."
# if a line in _AUXstmp contains a word found in _AUXf2,
# then it will write the line from _AUXstmp to _AUXmsg,
# thus filtering false positives length 2 words found
echo "Matching to Mapping File..."
grep -Fwf _AUXf2.txt _AUXstmp.txt > _AUXmsg.txt
# this extracts the all the letters in the third column
# into _AUXword, then it's concatenated into a string 
cut -c 4 _AUXmsg.txt > _AUXword.txt
declare -a letters
readarray -t letters <<< $( cat _AUXword.txt )
word="The Message is:$(tput setaf 6)"
for letter in $letters; do
	word="$word $letter"
done
echo "Done."
# prints the message found and removes all the auxiliary files created
echo $word
echo "$(tput setaf 3)Removing Auxiliary Files..."
rm _AUX*.txt
echo "Done."