# -*- encoding : utf-8 -*-
Backpacker::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  namespace "users", :as => "user" do
    resource :settings, :only => [:edit, :update]
  end

  get '/imprint', :to => 'welcome#imprint'
  get '/about', :to => 'welcome#about'

  root :to => 'welcome#index'
end
