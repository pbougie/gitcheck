#!/usr/bin/env bash

## gitcheck
## 2015-Sep-09: Initial script.
## 2017-Apr-06: Add folder exclusions.
## 2019-Jun-07: Show status even when no changes.

# Initialize variables
let repos=0
let repos_changed=0
let repos_unchanged=0

# Get command line arguments
while getopts x: option
do
  case "${option}"
  in
    x) EXCLUDE=${OPTARG};;
  esac
done

# Find repositories and loop through them
echo
while read folder
do
  if [ -n "${EXCLUDE}" ] && [[ $folder == *$EXCLUDE* ]]; then
    continue;
  fi

  let repos+=1

  # Move into repository folder
  repo="${folder%/.git}"
  cd "${repo}"

  # Check repository status
  status=`git status --porcelain`
  if [ -n "${status}" ]
  then # Repository has changes
    printf "\033[1;35m=== ${repo}\033[0m\n"
    git branch -vv && echo
    git status -s && echo
    let repos_changed+=1
  else # Repository has no changes
    printf "\033[1;36m=== ${repo}\033[0m\n"
    git branch -vv && echo
    let repos_unchanged+=1
  fi

  # Back to original folder
  cd - &> /dev/null
done < <(find . -type d -name .git | sort)

# Display tally
printf "${repos} git repositories: "
printf "${repos_unchanged} are unchanged, "
printf "${repos_changed} have changes."
echo && echo
