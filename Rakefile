## -*- encoding : utf-8 -*-
#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Backpacker::Application.load_tasks

begin
  require 'vlad'
  require 'vlad-extras'
  Vlad.load :scm => :git # takes an options hash depending on your setup
rescue LoadError
  puts 'Could not load Vlad'
end
