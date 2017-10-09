#!/bin/bash

MANIFEST=$1
METADATA=$2

if [ -d rna ];
then
	echo "RNA Files already Exist"
else
	mkdir -p rna
	cd rna

	gdc-client download -m ../$MANIFEST
	cd ..
fi


cat $METADATA | jq -r ' .[] | [.file_id, .file_name, .cases[0].submitter_id  ] | @csv ' > filename.map.csv 

cat  filename.map.csv
