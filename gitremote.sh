#!/bin/bash
clear
echo -n "Please Enter directory where you have clone your fork: "
read dir_path

echo "Directory entered:  $dir_path "

if cd $dir_path; then
	
	echo -n "Please Enter remote name: "
	read remote_name

	echo "Did you configured this url before?(y/n):"
	read character
	if [ "$character" = "n" ]; then
		echo "Please Enter remote Url from where you have forked repo: "
		read remote_url
		git remote add $remote_name $remote_url
	fi	
	
	echo "Fetching remote...."
	if git fetch $remote_name; then 
		echo "Fetch Success You want to merge this changes? (y/n)"
		read charactera
		if [ "$character" = "y" ]; then
			echo "Please Enter Branch Name to merge "
			read remote_branch
			echo "Merging...."
			git merge $remote_name/$remote_branch
		fi	
	else
		echo "Failed to Fetch :("
		exit 1
	fi	
	
else
	echo "Could not change directory! Aborting." 1>&2
	exit 1
fi
