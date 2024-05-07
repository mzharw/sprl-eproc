# frozen_string_literal: true
require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  resources :latihans
  authenticate :user, lambda { |u| u.has_role? 'Super Admin' } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :wbsprojects
  resources :currency_exchange_rates
  resources :buyer_plants
  resources :buyer_purch_groups
  resources :vendor_types
  resources :vendors do
    collection do
      get 'company_types', to: 'vendors#company_types'
    end
  end
  scope 'regions' do
    get 'countries', to: 'regions#country'
    get 'provinces', to: 'regions#province'
    get 'cities', to: 'regions#city'
    get 'subdistricts', to: 'regions#subdistrict'
    get 'postalcode', to: 'regions#postalcode'
  end
  resources :banks, only: :index
  resources :purch_order_item_types
  resources :purch_order_items
  resources :purch_order_types
  resources :purch_orders
  resources :prcmt_items
  resources :prcmt_types
  resources :tasks, only: :index
  resources :workflows
  resources :workflow_instance, only: :update
  resources :commodity_lists, path: 'commodity-list'
  resources :work_acceptance_note_items
  resources :work_acceptance_notes do
    member do
      delete 'remove-attachment', to: 'work_acceptance_notes#remove_attachment', as: 'remove_attachment'
    end
  end
  resources :facilities
  resources :parties
  resources :buyers, path: 'buyer'
  resources :measurement_units, path: 'uom'
  resources :products, path: 'material'
  resources :product_groups, path: 'material-group'
  resources :product_services, path: 'product-service' do
    member do
      get 'items', to: 'product_services#items'
      get 'item', to: 'product_services#new_item'
      post 'item', to: 'product_services#create_item'
      get 'item/:item_id', to: 'product_services#edit_item', as: 'edit_item'
      patch 'item/:item_id', to: 'product_services#update_item', as: 'update_item'
      delete 'item/:item_id', to: 'product_services#delete_item', as: 'delete_item'
    end
  end
  resources :product_service_groups, path: 'product-service-group'
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
      get '/new/:item_type', to: 'purch_reqn_items#new', as: :new_purch_reqn_item
      post '/new/:item_type', to: 'purch_reqn_items#create', as: :create_purch_reqn_item
      scope ':item_id' do
        patch '/', to: 'purch_reqn_items#update', as: :update_purch_reqn_item
        delete '/', to: 'purch_reqn_items#destroy', as: :destroy_purch_reqn_item
        get '/', to: 'purch_reqn_items#edit', as: :purch_reqn_item
        get 'new/:item_type', to: 'purch_reqn_items#new', as: :new_service_purch_reqn_item
        post 'new/:item_type', to: 'purch_reqn_items#create', as: :create_service_purch_reqn_item
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

  resources :users, path: 'user' do
    member do
      get 'change-password', to: 'users#change_password'
      post 'change-password', to: 'users#change_password'
    end
  end

  resources :roles, path: 'roles'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'tasks#index'
end
