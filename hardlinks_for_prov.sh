#! /bin/bash

# run only after having replaced default configs
# with those from the repo
# this is to accomplish re-linking of the updated
# configs should they be further edited

endswith() {
  test_str=$1
  suffix=$2
  if [[ ${test_str:(-1)} == "$suffix" ]]; then
    echo 1
  else
    echo 0
  fi
}

user_home=$1
if [[ $(endswith $user_home /) ]]; then
  user_home=${user_home::-1}
fi
repo_loc="$user_home/repos/wkstn-prov"

ln -f /etc/default/grub "$repo_loc/etc/default/grub"
ln -f /etc/profile "$repo_loc/etc/profile"
ln -f "$user_home/.bash_profile" "$repo_loc/home/.bash_profile"
ln -f "$user_home/.bashrc" "$repo_loc/home/.bashrc"

ln -f "$user_home/.config/i3/config" "$repo_loc/home/.config/i3/config"
ln -f "$user_home/.ssh/config" "$repo_loc/home/.ssh/config"
