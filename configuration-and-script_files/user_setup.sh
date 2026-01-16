#!/bin/bash

#The purpose of this script is to automate the creation of a user on the system and assign it
# to a group

echo -e "\nPlease note that you can't enter names having the following\n
1) Starting with a number, Ex: 12Ahmad, 12\n2) Starting with uppercase letters, Ex: Ahmed, USER1
3) Special characters, EX: @ ! $ % ... "

# check if it the correct foramt
while true; do

  read -p "Enter username:" username
  if [[ ! "$username" =~ ^[a-z][a-z0-9_]*$ ]]; then
    echo "Error: only lowercase letters, numbers and underscores are allowed"
    echo "Please re-enter a name with the correct format"
  else
    break
  fi
done

put_password() {
  while true; do
    sudo passwd "$username"
    if [ "$?" == 0 ]; then
      break
    fi
    echo "Password doesn't match"
  done
}
# Make the username and password
sudo adduser "$username"
if [ "$?" == 0 ]; then
  put_password
else
  echo "Passed"
fi

while true; do
  read -p "Do you want to delete the user ? yes/no " take
  case "$take" in
  yes)
    sudo userdel -r "$username"
    echo "User deleted succefully"
    exit 0
    ;;
  no)
    break
    ;;
  *)
    echo "Enter yes or no please"
    ;;
  esac
done

# Assign the user to a departmental group or adminstartive group
groups=("hr_grp" "managment_grp" "engineering_grp" "finance_grp" "it")

#Enter group function and Check if group num is correct
choose_group() {

  echo "Which group do you want to assign the user into ?"
  echo "Choose a number 1-5 ."
  echo -e "1) hr_grp\n2) managment_grp\n3) engineering_grp\n4) finance_grp\n5) it"
  while true; do
    read -p "Enter group: " grpNum

    if [[ ! "$grpNum" =~ ^[1-5]$ ]]; then
      echo "Invalid group number"
    else
      ((grpNum -= 1))
      sudo usermod -aG "${groups[$grpNum]}" "$username"
      echo "$username added successfully to group ${groups[$grpNum]}"
      break
    fi
  done
}

#start the function
choose_group

#Add the username to the group
#Change group if choose one by mistake
while true; do
  read -p "Do you want to remove the user from this group? yes/no " remove
  case "$remove" in
  yes)
    sudo gpasswd -d "$username" "${groups[$grpNum]}"
    echo "User deleted from the group succesfully"
    choose_group
    ;;
  no)
    echo -e "Done\n"
    break
    ;;
  *)
    echo "Enter yes or no please"
    ;;
  esac
done

#If the group is it then add it to the wheel group for admin access
if [[ "$grpNum" == 4 ]]; then
  sudo usermod -aG wheel "$username"
fi

echo -e "Username in /etc/passwd file:"
sudo cat /etc/passwd | grep "$username"
echo -e "\n"
echo -e "Username in /etc/group file:"
sudo cat /etc/group | grep "$username"
