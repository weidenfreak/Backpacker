# # -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Meike',
  :email => 'someUser@example.com',
  :password => 'please',
  :password_confirmation => 'please',
  :latitude => 53.56723,
  :longitude => 9.990463,
  :tagline => 'still at home :(',
  :description => "I'll be in NZ within the german winter months. I already booked a camper for 5 weeks in november. Ping me if you want to join.",
  :status => "stuck"
puts 'New user created: ' << user.name

user2 = User.create! :name => 'Test User2',
  :email => 'someOtherUser@example.de',
  :password => 'please',
  :password_confirmation => 'please',
  :latitude => 3.13983,
  :longitude => 101.686649,
  :tagline => "no rice, please!",
  :status => "free"
puts 'New user created: ' << user2.name

user3 = User.create! :name => 'Fred Feuerstein',
  :email => 'sampleMail@somewhere.com',
  :password => 'please',
  :password_confirmation => 'please',
  :latitude => -41.275742,
  :longitude => 174.775887,
  :tagline => 'I have a secret!',
  :status => "soon-free"
puts 'New user created: ' << user3.name
