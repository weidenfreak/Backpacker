# -*- encoding : utf-8 -*-
# Custom variables used in the following config
set :application, "backpacker"
set :username, "surface"

# Required variables
set :domain, "surface@serpens.uberspace.de"
set :deploy_to, "/var/www/virtual/#{username}/rails/#{application}"
set :repository, "git@github.com:weidenfreak/Backpacker.git"

# Optional variables
set :user, "deploy" # if different from your current login
set :bundle_cmd," ~/.gem/ruby/1.9.1/bin/bundle"
set :rake_cmd, "#{bundle_cmd} exec rake"
set :revision, "origin/master"

# vlad-extras config
set :copy_shared, {
  'config/database.yml'     => 'config/database.yml' }
set :symlinks, {
  'assets'              => 'public/assets',
  'config/database.yml' => 'config/database.yml' }

# Bundler ships with vlad integration you'll have to require
# in order to use the vlad:bundle tasks
require 'bundler/vlad'

# Require custom vlad tasks or recipes from vlad-extras
require 'vlad/maintenance'
