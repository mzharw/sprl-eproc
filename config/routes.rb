# frozen_string_literal: true

Rails.application.routes.draw do
  resources :buyers
  resources :measurement_units
  resources :products
  resources :product_groups
  resources :prcmts
  resources :contract_references
  resources :currencies
  resources :cost_centers
  resources :plants
  resources :purch_groups
  resources :purch_orgs
  resources :purch_reqn_cancellations
  resources :purch_reqn_item_buyers
  resources :purch_reqn_item_histories
  resources :purch_reqn_items
  resources :purch_reqn_link_types
  resources :purch_reqn_links
  resources :purch_reqn_partial_statuses
  resources :purch_reqn_partials
  resources :purch_reqn_uncommits
  resources :purch_reqns, path: 'purchase-requisitions'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'password',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    sign_up: 'new'
  }, controllers: { sessions: 'users/sessions' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'static#index'
end
