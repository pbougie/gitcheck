#!/usr/bin/env bash

## gitcheck
## 2015-Sep-09: initial script.

# Initialize variables
let repos=0
let repos_changed=0
let repos_unchanged=0

# Find repositories and loop through them
while read folder
do
  let repos+=1

  # Move into repository folder
  repo="${folder%/.git}"
  cd "${repo}"

  # Check repository status
  status=`git status --porcelain`
  if [ -n "${status}" ]
  then # Repository has changes
    printf "\n===== ${repo}\n\n"
    git branch -vv && echo
    git status -s && echo
    let repos_changed+=1
  else # Repository has no changes
    let repos_unchanged+=1
  fi

  # Back to original folder
  cd - &> /dev/null
done < <(find . -type d -name .git)

# Display tally
printf "\n${repos} git repositories: "
printf "${repos_unchanged} are unchanged, "
printf "${repos_changed} have changes.\n\n"