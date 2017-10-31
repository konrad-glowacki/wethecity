# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :super_admins
    resources :accounts
    resources :resources

    root to: 'users#index'
  end

  devise_for :users
  devise_for :super_admins

  namespace :admin do
    resources :super_admins
    root to: 'super_admins#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
