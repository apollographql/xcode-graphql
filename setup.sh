#!/usr/bin/env bash

# Use this script for versions of Xcode other than Xcode 11.

set -o xtrace

# Create plug-ins directory if it doesn't exist
plugins_dir=~/Library/Developer/Xcode/Plug-ins/
if [ ! -d "$plugins_dir" ]; then
	mkdir $plugins_dir
fi

# Copy the IDE Plugin to the plug-ins directory
cp -r GraphQL.ideplugin $plugins_dir

# Create Specifications directory if it doesn't exist
spec_dir=~/Library/Developer/Xcode/Specifications
if [ ! -d "$spec_dir" ]; then
	mkdir $spec_dir
fi

echo '🎉 Apollo Xcode Add-ons installation has completed! Please restart Xcode and click "Load bundle" when an alert shows about GraphQL.ideplugin.'
