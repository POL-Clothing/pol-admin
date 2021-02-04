#!/bin/bash
set -e

echo "CURRENT DIRECTORY: $PWD"

# Remove a potentially pre-existing server.pid for Rails.
rm -f /dna/tmp/pids/server.pid

rails g spree:install --user_class=Spree::User
rails g spree:auth:install
rails g spree_gateway:install
rake db:schema:load
rake db:seed
rake spree_sample:load

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"