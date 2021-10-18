#!/bin/sh

read -p "You are about to install a pre-commit hook for EcoOnline packages. Do you want to continue? y/n" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo "Bye!"
  exit
fi

cp pre-commit git-hooks/pre-commit
touch whitelist_custom

#Empty the variable
sed -i '' "s?ROOT_CONFIG=\"[^\"][^\"]*\"?ROOT_CONFIG=""?" git-hooks/pre-commit

# Populate the variable
sed -i '' "s|ROOT_CONFIG=|ROOT_CONFIG=\"$(pwd)\"|g" git-hooks/pre-commit

GIT_CONFIG=~/.gitconfig
HOOKS_PATH=hookspath="$PWD"/git-hooks

if [ ! -f "$GIT_CONFIG" ]; then
    echo ".gitconfig doesn't exist. Creating it..."
    touch ~/.gitconfig
fi

if grep -q "$HOOKS_PATH" "$GIT_CONFIG"; then
  echo "Hook already active"
  exit
fi

echo "Adding hook..."

# No core hooks defined
if ! grep -Fxq "[core]" "$GIT_CONFIG"; then
  echo '[core]' >> "$GIT_CONFIG"
fi

sed -i.bu 's/core]/core]\n   '"${HOOKS_PATH//\//\\/}"'/' $GIT_CONFIG
echo "All done!"
