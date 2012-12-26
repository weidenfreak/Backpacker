# -*- encoding : utf-8 -*-

# Custom variables used in the following config
set :application, "backpacker"
set :user, "surface"

# Required variables
set :domain, "surface@serpens.uberspace.de"
set :deploy_to, "/var/www/virtual/#{user}/rails/#{application}"
set :repository, "."

# Optional variables
set :bundle_cmd," ~/.gem/ruby/1.9.1/bin/bundle"
set :rake_cmd, "#{bundle_cmd} exec rake"
set :revision, "origin/master"

set :app_server_port, 87654
set :app_server_start_cmd, "#{bundle_cmd} exec thin start -p #{app_server_port} -e #{rails_env}"

# vlad-extras config
set :copy_shared, {
  'config/database.yml'     => 'config/database.yml' }
set :symlinks, {
  'assets'              => 'public/assets',
  'config/database.yml' => 'config/database.yml' }
set :setup_tasks, %w(
  vlad:setup_app
  vlad:copy:shared
  vlad:assets:create_shared_dir
  vlad:uberspace:setup
  vlad:uberspace:create_database_yml
 )
set :deploy_tasks, %w(
  vlad:update
  vlad:uberspace:create_reverse_proxy_htaccess
  vlad:symlink
  vlad:bundle:install
  vlad:assets:precompile
  vlad:migrate
  vlad:start_app
  vlad:cleanup)

namespace :vlad do

  namespace :uberspace do

    desc 'Setup service script for the app'
    remote_task :setup_service do
      puts '[Uberspace] Setup service'
      unless app_server_start_cmd
        raise(Rake::ConfigurationError,
          'Please specify the application server start command via the :app_server_start_cmd variable')
      end
      etc_dir = "#{uberspace_home}/etc/run-rails-#{application}"
      # install
      run "mkdir -p #{etc_dir}"
      run "mkdir -p #{etc_dir}/log"
      put "#{etc_dir}/run" do
        <<-EOF
#!/bin/bash
export HOME=#{uberspace_home}
source $HOME/.bash_profile
cd #{current_path}
exec #{app_server_start_cmd} 2>&1
EOF
      end
      put "#{etc_dir}/log/run" do
        <<-EOF
#!/bin/sh
exec multilog t ./main
EOF
      end
      run "chmod +x #{etc_dir}/run"
      run "chmod +x #{etc_dir}/log/run"
      run "ln -nfs #{etc_dir} #{uberspace_service}"
    end
  end
end

# Bundler ships with vlad integration you'll have to require
# in order to use the vlad:bundle tasks
require 'bundler/vlad'

# Require custom vlad tasks or recipes from vlad-extras
require 'vlad/maintenance'
require 'vlad/uberspace'

