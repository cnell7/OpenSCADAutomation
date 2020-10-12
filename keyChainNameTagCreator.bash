#!/bin/bash
cd /Users/christiannell/desktop/research/NIRAL/code/second-round
saveDir="keyChainNameTags"
openSCAD_file="keyChainTitle.scad"
nameTagInputDir="Priority2"
subStr=""
declare -a doneTags
mkdir $saveDir
cd $nameTagInputDir
for FILE in *.vtk; 
	do (
		if [ "${FILE:0:7}" == "stx_neo" ]; then 
			pat="([^neo]*)-([^-]*)"
			[[ $FILE =~ $pat ]]	
			subStr="${BASH_REMATCH[1]}"
			subStr=${subStr:1}
			echo $subStr
			cd ..
			/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o "${saveDir}/${subStr}.stl" $openSCAD_file -D "input=\"$subStr\"" -D "length=\"7.5\""
		elif [ "${FILE:0:4}" == "stx_" ]; then
			pat="([^_]*)-([^-]*)"
			[[ $FILE =~ $pat ]]	
			subStr="${BASH_REMATCH[1]}"
			echo $subStr
			cd ..
			/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o "${saveDir}/${subStr}.stl" $openSCAD_file -D "input=\"$subStr\"" -D "length=12"
			doneTags[\'${subStr}\']=1
			echo ${doneTags[$subStr]}
		fi
		cd $nameTagInputDir
	);done
