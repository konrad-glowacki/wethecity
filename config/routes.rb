# frozen_string_literal: true

require 'resque/server'

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :projects, constraints: { id: /([0-9]+)/ }

  namespace :admin do
    resources :users
    resources :accounts
    resources :projects
    resources :resources
    resources :super_admins

    root to: 'projects#index'

    authenticate :super_admin do
      mount Resque::Server, at: '/jobs'
    end
  end

  devise_for :super_admins, path: 'admin', controllers: {
    confirmations: 'admin/confirmations',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
    unlocks: 'admin/unlocks'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
