#!/bin/bash
cd ~
echo "Enter the name of the folder"
read folderName
touch ./$folderName.txt
touch ./.fileList.txt
n=1
for file in "./$folderName"/*
do
  echo "$(basename "$file")" >> ./.fileList.txt
done


while IFS= read -r line
do
        fileName="$line"
        echo "$n.$fileName" >> ./$folderName.txt
        file="./$folderName/$fileName"
        while IFS= read -r line
        do
                echo "$line" >> ./$folderName.txt
        done < "$file"
        ((n++))
done < ".fileList.txt"
rm ./.fileList.txt
