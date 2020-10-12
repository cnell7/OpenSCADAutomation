#! /bin/bash
cd /Users/christiannell/desktop/research/NIRAL/code/second-round
saveDir="keyChainNameTags"
openSCAD_file="keyChainTitle.scad"
nameTagInputDir="Priority2"
subStr=""
mkdir $saveDir
cd $nameTagInputDir
for FILE in *.vtk; 
	do (
		if [ "${FILE:0:7}" == "stx_neo" ]; then 
			pat="([^neo]*)-([^-]*)"
			[[ $FILE =~ $pat ]]	
			subStr="${BASH_REMATCH[1]}"
			subStr=${subStr:1}
		elif [ "${FILE:0:4}" == "stx_" ]; then
			pat="([^_]*)-([^-]*)"
			[[ $FILE =~ $pat ]]	
			subStr="${BASH_REMATCH[1]}"
		cd ..
		/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o "${saveDir}/${subStr}.stl" $openSCAD_file -D "input=\"$subStr\""
		cd $nameTagInputDir
	fi
	);done
cd ..
