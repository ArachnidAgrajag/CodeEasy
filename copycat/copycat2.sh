#!/bin/bash
cd ~
n=1
echo "Enter the name of the file"
read fileName
input="./$fileName.txt"
if [ ! -d ./$fileName"c" ]
then
        mkdir ./$fileName"c"
fi
while IFS= read -r line
do
if [[ $line = $n"."* ]]
        then
                if [ $n -lt 9 ]
                                        then
                                                file=${line:3}
                                        else
                                                file=${line:4}
                                fi
                if [ ${#file} -eq 0 ]
                        then
                                touch ~/$fileName"c"/$fileName"_p"$n".c"
                        else
                                touch ~/$fileName"c"/$file
                fi
                ((n++))
                i=$((n-1))
        else
                 if [ ${#file} -eq 0 ]
                        then
                                include="#include<stdio.h>"
                                echo "$line" >> ~/$fileName"c"/$fileName"_p"$i".c"
                                echo "$include" >>  ~/$fileName"c"/$fileName"_p"$i".c"
                        else
                                echo "$line" >> ~/$fileName"c"/$file
                fi
fi
done < "$input"

