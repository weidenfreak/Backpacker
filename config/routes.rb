# -*- encoding : utf-8 -*-
Backpacker::Application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]

  root :to => 'welcome#index'
end
