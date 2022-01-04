#!/bin/sh

### brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### node
brew install nodenv
# nodenv install (最新版)
node install -g github-changes

brew install rbenv
# rbenv install (最新版)
gem install -g github_changelog_generator

### python
brew install pyenv
### pyenv install (最新版)
pip install pandas
