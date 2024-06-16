#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Change directory to project root.
cd "$(dirname "$0")/.."

# Clone a GitHub repository to the examples directory
# clone_repo OWNER NAME SHA
function clone_repo {
    repo_owner=$1
    repo_name=$2
    repo_ref=$3
    repo_slug="$repo_owner/$repo_name"
    
    example_slug="$repo_owner-$repo_name"
    example_path="test/examples/$example_slug"
    if [ ! -d "$example_path" ]; then
        git clone "https://github.com/$repo_slug" "$example_path" --quiet
    fi
    
    pushd "$example_path" >/dev/null
    git fetch --quiet
    git reset --hard "$repo_ref" --quiet
    popd >/dev/null
}

clone_repo AndreasArvidsson andreas-talon 43811bae4c1a75f2ecd29240891f6612a1b7cec5
clone_repo nriley talon_community 1ff0e36f47689193be1d8909b9935f7c7004a045
clone_repo phillco talon-axkit 8eecc78b2de65b68123a6e1eae72a5a790a4e407
clone_repo talonhub community 93c9261c240078c46290ae1a500f2c9cfc749833
