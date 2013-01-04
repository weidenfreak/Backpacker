# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }
    name 'Test User'
    sequence(:email) {|n| "person#{n}@example.com" }
    password 'please'
    password_confirmation 'please'
  end
end
