#! /bin/bash
cd /Users/christiannell/desktop/research/code
saveDir="keyChainNameTags"
openSCAD_file="keyChainTitle.scad"
nameTagInputDir="Priority"

cd $nameTagInputDir
for FILE in *.vtk; 
	do (if [ "${FILE:0:7}" == "stx_neo" ]; then 
		echo $FILE | cut -d'-' -f 2
	elif [ "${FILE:0:4}" == "stx_" ]; then
		tagName=cut -d'_' -f 2
		
	fi
);done

cd ..

mkdir $saveDir
