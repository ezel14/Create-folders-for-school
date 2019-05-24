#!/bin/bash

# This script creates folders and directories
# I created this for making folders for school

#Give execute permission to your script:
#chmod +x folders1.0.sh

#run script in current directory
#./ folders1.0.sh

#shows processes
set -x

#This function creates week1-12 folders in a specified directory
function option1()
{
  #Type the directory for the folders
  read -p "Type the directory for the 1-12 week folders:" directory
	# checks if it is a directory 
	if [ -d "$directory" ] 
	then
		cd $directory 
		sudo mkdir -p week{1..12}
		sudo chmod 777 week*
	fi
}

#This function creates a parent folder first then creates week1-12 child folders
function option2()
{
  #Type the directory for the folders
  read -p "Type the directory for the 1-12 week folders:" directory
	# checks if it is a directory 
	if [ -d "$directory" ] 
	then
		cd $directory 	
		read -p "Type the parent folder name:" parentFolder
		sudo mkdir -p $parentFolder/week{1..12} 
		sudo chmod 777 week*
	fi
}	

#This function lets the user create multiple folders until exit option is specified
function option3()
{
  #While loop with a break option
  while :
  do
    read -p "1 to create 2 to exit " choice
    if [ "$choice" == "2" ] 
    then
      break
    fi
    #Type the directory for the folders
    read -p "Type the directory for the folder/s:" directory	
    # checks if it is a directory 
    if [ -d "$directory" ] 
    then
      cd $directory  
      read -p "Type the parent folder name:" parentFolder
      #Creates parent folder 
      sudo mkdir -p $parentFolder 
      sudo chmod 777 $parentFolder
    fi
    
  done

}

#This function creates folders [name]1-12 with a specified name
function option4()
{
  read -p "Type the directory for the [name]1-12 week folders:" directory
	# checks if it is a directory 
	if [ -d "$directory" ] 
	then
		cd $directory 
    read -p "Type the name for the [name]1-12 folders:" name
		sudo mkdir -p "$name"{1..12}
		sudo chmod 777 $name*
	fi
}

# This function moves directories
function option5()
{
  #Type the directory for the folders
  read -p "Type the directory source" directory
  # checks if it is a directory 
  if [ -d "$directory" ] 
  then 
    read -p "Type the directory target" directory2 
    if [ -d "$directory2" ] 
    then
      mv $directory $directory2 
    fi
  fi
}

	
read -p " `echo $'\n> '`1 to create week1-12 folders`echo $'\n> '` 2 to create a parent folder with week1-12 subfolders`echo $'\n> '` 3 to create a folder `echo $'\n> '` 4 create [name]1-12 folders `echo $'\n> '` 5 to move a directory `echo $'\n> '` " choice

if [ "$choice" == "1" ] 
then
  option1
elif [ "$choice" == "2" ] 
then
  option2
elif [ "$choice" == "3" ] 
then
  option3
  elif [ "$choice" == "4" ] 
then
  option4
  elif [ "$choice" == "5" ] 
then
  option5
else
  echo "Choose an option to continue"
  echo "Exiting!"
  exit 1;	
fi