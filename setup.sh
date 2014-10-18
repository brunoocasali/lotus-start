#!/bin/bash
mkdir -p spec/features
mkdir -p templates/home
 
mv spec_helper.rb spec
mv home_page_spec.rb spec/features
mv index.html.erb templates/home
 
bundle
 
# This script will self destruct in 3, 2, 1.. poof!
rm -- "$0"
