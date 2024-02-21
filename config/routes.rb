# frozen_string_literal: true

Rails.application.routes.draw do
  resources :prcmt_types
  resources :tasks, only: :index
  resources :workflows
  resources :workflow_instance, only: :update
  resources :commodity_lists, path: 'commodity-list'
  resources :work_acceptance_note_items
  resources :work_acceptance_notes
  resources :facilities
  resources :parties
  resources :buyers, path: 'buyer'
  resources :measurement_units, path: 'uom'
  resources :products, path: 'product'
  resources :product_groups, path: 'product-group'
  resources :prcmts, path: 'procurement'
  resources :contract_references
  resources :currencies, path: 'currency'
  resources :cost_centers, path: 'cost-center'
  resources :plants, path: 'plant'
  resources :purch_groups, path: 'purchase-group'
  resources :purch_orgs, path: 'purchase-organization'
  resources :purch_reqn_cancellations, path: 'purchase-requisitions-cancellation'
  resources :purch_reqn_item_buyers
  resources :purch_reqn_item_histories
  resources :purch_reqn_link_types
  resources :purch_reqn_links
  resources :purch_reqn_partial_statuses
  resources :purch_reqn_partials
  resources :purch_reqn_uncommits
  resources :purch_reqns, path: 'purchase-requisition', shallow: true do
    member do
      delete 'remove-attachment', to: 'purch_reqns#remove_attachment', as: 'remove_attachment'
    end
  end

  scope 'purchase-requisition/:id' do
    scope 'items' do
      match '/', to: 'purch_reqn_items#index', via: [:get, :post], as: :purch_reqn_items
    end
    scope 'item' do
      get ':item_type', to: 'purch_reqn_items#new', as: :new_purch_reqn_item
      post ':item_type', to: 'purch_reqn_items#create', as: :create_purch_reqn_item
      scope ':item_id' do
        patch '/', to: 'purch_reqn_items#update', as: :update_purch_reqn_item
        delete '/', to: 'purch_reqn_items#destroy', as: :destroy_purch_reqn_item
        get 'view', to: 'purch_reqn_items#edit', as: :purch_reqn_item
        get ':item_type', to: 'purch_reqn_items#new', as: :new_service_purch_reqn_item
        post ':item_type', to: 'purch_reqn_items#create', as: :create_service_purch_reqn_item
      end
    end
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'password',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    sign_up: 'new'
  }, controllers: { sessions: 'users/sessions' }

  resources :users, path: 'user/personnels'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'static#index'
end
