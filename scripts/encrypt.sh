#!/usr/bin/env bash

#Before use:
# Place encrypt.sh in path: $HOME/scripts/encrypt.sh
# Add the following line (without "#") to your $HOME/.bashrc or $HOME/.zshrc
# alias encrypt=$HOME/scripts/encrypt.sh

# Usage:
# To encrypt: "encrypt myfile.txt"
# To decrypt: "encrypt myfile.gpg -d"

function decrypt(){
# start decrypting
decrypted=decrypted_$1
gpg -d $1 > $decrypted
}


echo "Welcome, I am ready to encrypt a file/folder for you"
echo "currently I have a limitation, Place me to the same folder, where a file to be encrypted is present"
echo "Enter the Exact File Name with extension"
if [-z $1]
then read -r file
else
file=$1
fi
if [$2 == -d]
then
decrypt
else
# start encrypting
gpg -c "$file"
if [ $? == 0]
then
echo "I have encrypted the file sucessfully..."
echo "Now I will be removing the original file"
rm -rf "$file"
else
echo "Something has failed, please start again"
fi
fi
