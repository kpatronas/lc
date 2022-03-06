#!/bin/bash

IFS=$'\n'
WORK_PATH=`pwd`
FILE_PATTERN="*"

while getopts ":w:p:r:" opt;
do

  case $opt in
    w) WORK_PATH="$OPTARG"
    ;;
    p) FILE_PATTERN="$OPTARG"
    ;;
    r) LEVEL="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac
  case $OPTARG in
    -*) echo "Option $opt needs a valid argument"
    exit 1
    ;;
  esac
done

if [[ -z $LEVEL ]]
then
    FILES=(`find $WORK_PATH -type f -name "$FILE_PATTERN" -exec readlink -f {} \;`)
else
    FILES=(`find $WORK_PATH -maxdepth $LEVEL -type f -name "$FILE_PATTERN" -exec readlink -f {} \;`)
fi

for FILE in "${FILES[@]}"
do
   if [[ "$(file -b --mime-encoding "$FILE")" != binary ]]
   then
       line_count=`cat "$FILE" | wc -l`
       echo "$FILE $line_count"
   fi
done
