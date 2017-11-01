# frozen_string_literal: true

require 'resque/server'

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_for :super_admins, path: 'admin'

  namespace :admin do
    resources :users
    resources :super_admins
    resources :accounts
    resources :resources
    resources :super_admins

    root to: 'users#index'

    authenticate :super_admin do
      mount Resque::Server, at: '/jobs'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
