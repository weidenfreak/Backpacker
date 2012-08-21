# -*- encoding : utf-8 -*-
#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
# include uberspacify base recipes
require 'uberspacify/base'

# comment this if you don't use MySQL
# require 'uberspacify/mysql'

# the Uberspace server you are on
server 'cetus.uberspace.de', :web, :app, :db, :primary => true

# your Uberspace username
set :user, 'surface'

# a name for your app, [a-z0-9] should be safe, will be used for your gemset,
# databases, directories, etc.
set :application, 'backpacker'

# the repo where your code is hosted
set :scm, :none
set :repository, "."
set :deploy_via, :copy

# optional stuff from here

# By default, your app will be available in the root of your Uberspace. If you
# have your own domain set up, you can configure it here
# set :domain, 'www.dummyapp.com'

# By default, uberspacify will generate a random port number for Passenger to
# listen on. This is fine, since only Apache will use it. Your app will always
# be available on port 80 and 443 from the outside. However, if you'd like to
# set this yourself, go ahead.
# set :passenger_port, 55555

# By default, Ruby Enterprise Edition 1.8.7 is used for Uberspace. If you
# prefer Ruby 1.9 or any other version, please refer to the RVM documentation
# at https://rvm.io/integration/capistrano/ and set this variable.
set :rvm_ruby_string, '1.9.3@rails-backpacker'
