# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :projects, constraints: { id: /([0-9]+)/ }, only: [:show]

  namespace :admin do
    resources :projects
    resources :users
    resources :organisations
    resources :administration_offices
    resources :companies
    resources :categories
    resources :resources
    resources :engagements
    resources :super_admins

    root to: 'projects#index'

    authenticate :super_admin do
      mount Sidekiq::Web, at: '/sidekiq'
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
