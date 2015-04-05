Rails.application.routes.draw do

  resources :business_users

  resources :businesses

  resources :supports
 
  get 'dashboard/index'

  resources :currencies

  resources :countries

  resources :settings, only: :index

  resources :categories

  resources :clients

  resources :tasks

  devise_for :users

  resources :teams

  resources :tickets

  resources :entries

  resources :users

  resources :estimates do
    member do
      get :preview
      post :close
      post :duplicate
      post :mark_as_sent
      post :mail
    end
  end

  resources :bills do
    member do
      get :preview
      post :close
      post :duplicate
      post :mark_as_sent
      post :mail
    end
  end

  resources :items

  resources :invoices do
    member do
      get :preview
      post :close
      post :duplicate
      post :mark_as_sent
      post :mail
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "dashboard#index"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
