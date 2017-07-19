#!/bin/bash

# store the current dir
CUR_DIR=$(pwd)

# Let the person running the script know what's going on.
echo "Pulling in latest changes for all repositories..."

# Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
	j=$(echo $i | cut -d'/' -f1)
    echo "GIT Repository:" $j;

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # finally pull
    read -r -p "Do you want to push "$j" branch to Vodafone? [Y] " response
	case "$response" in
    [Y])
		echo "Code pushed to Vodafone"
		git push vodafone cycloid_development
		;;
    *)
		echo "The "$j" branch won't be to Vodafone"
		;;
    esac

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo "Complete!"

echo "Press any key to exit"
read -s -n 1 any_key
echo "Now exiting"