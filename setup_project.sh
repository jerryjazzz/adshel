#!/bin/bash
echo "Setting up Adshel project now."

cd api
bundle
bundle exec rake db:setup

echo "Done."
