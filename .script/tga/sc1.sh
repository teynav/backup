#!/bin/bash
set -e
a=$1
a=$(echo "$1" |  sed "s/ \//\n \//g" )
name=$3
if [[ $name == "" ]]
then
    name="default"
fi
SAVEIFS=$IFS   # Save current IFS
IFS=$'\n'      # Change IFS to new line
a=($a) # split to array $names
IFS=$SAVEIFS   # Restore IFS
q[0]=$""
for i in ${!a[@]}
do
  a[$i]=$(echo ${a[$i]} | sed "s/^.*\///g" )
  echo ${a[$i]}
done
echo These files will be Compressed
pw=$(pwd)
q=$(echo $q)
read x
if [[ $4 == "" ]]
then
tar -cvf "$name.tar" "${a[@]}"
else
env GZIP=-$4 tar -cvzf "$name.tar.gz" "${a[@]}"
fi
if [[ $2 == "2" ]]
then
rm -rf "${a[@]}"
fi
