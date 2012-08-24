# -*- encoding : utf-8 -*-
Backpacker::Application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]

  match '/imprint', :to => 'welcome#imprint'
  match '/about', :to => 'welcome#about'

  root :to => 'welcome#index'
end
