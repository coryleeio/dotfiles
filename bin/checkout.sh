#!/bin/bash

# Modified version of https://gist.github.com/caniszczyk/3856584#gistcomment-3157288

# Sample syntax:
#   foobar\.git
#   foobar\.git|helloworld\.git
IGNORED_REPO_COUNT=0

ORG=$1
REPO_TYPE="all"
# per_page maxes out at 100
PER_PAGE=100

TEST_RUN=false

for ((PAGE=1; ; PAGE+=1)); do
  # Page 0 and 1 are the same
  # Change authorization method as needed
  INPUT=$(curl -H "Authorization: token $GITHUB_TOKEN" -s "https://api.github.com/orgs/$ORG/repos?type=$REPO_TYPE&per_page=$PER_PAGE&page=$PAGE" | jq -r ".[].ssh_url")
  if [[ -z "$INPUT" ]]; then
    echo "All repos processed, ignored $IGNORED_REPO_COUNT repo(s) and stopped at page=$PAGE"
    exit
  fi
  while read REPO_URL ; do

      if $TEST_RUN; then
        echo "git clone $REPO_URL"
      else
        #git clone "$REPO_URL" >/dev/null 2>&1 ||   # Pipe stdout and stderr to /dev/null
        #git clone --depth 1 "$REPO_URL" ||         # Shallow clone for faster cloning, within the repo use the following to get the full git history: git pull --unshallow
        git clone "$REPO_URL" ||                    # Vanilla
          { echo "ERROR: Unable to clone $REPO_URL!" ; continue ; }
      fi
# This syntax works as well /shrug
#  done <<< "$INPUT"
  done < <(echo "$INPUT")
done
