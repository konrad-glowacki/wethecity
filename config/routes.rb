# frozen_string_literal: true

require 'resque/server'

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :admin do
    resources :projects
    resources :users
    resources :organisations
    resources :city_offices
    resources :companies
    resources :categories
    resources :resources
    resources :super_admins
    resources :engagements

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
