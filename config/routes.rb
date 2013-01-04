# -*- encoding : utf-8 -*-
Backpacker::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  namespace "users", :as => "user" do
    resource :settings, :only => [:edit, :update]
  end

  match '/imprint', :to => 'welcome#imprint'
  match '/about', :to => 'welcome#about'

  root :to => 'welcome#index'
end
