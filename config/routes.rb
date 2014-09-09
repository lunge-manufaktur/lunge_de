LungeDe::Application.routes.draw do

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

  root :to => "home#index"

  # /api/...
  namespace :api, defaults: {format: 'json'} do
    resources :brands
    resources :employees
    resources :events
    resources :products
    resources :product_categories
    resources :product_categorizations
    resources :properties
    resources :sizes
    resources :stocks
    resources :stores
  end

  namespace :admin do
    resources :events
  end

  resources :api_keys
  resources :categorizations
  resources :categories
  resources :events
  resources :posts
  resources :properties
  resources :stocks
  resources :stores do
    member do
      post :get_directions
    end
  end
  resources :brands
  resources :product_images
  resources :product_categories
  resources :sizes
  resources :products do
    get "featured" => "products#show_featured", :as => "featured"
    collection do
      post "search", to: "products#search", as: "search"
      get "tags/:tags", to: "products#index", as: :tag
      get "page/:page", :action => :index
      get "remove_tag/:tag", :action => "remove_tag", :as => "remove_tag"
    end
    resources :product_images
    resources :properties
    member do
      get :edit_product_images
      get :edit_properties
      patch :save_properties
    end
  end

  # custom routes
  get "contact", controller: "contact_form", action: "new"
  post "contact", controller: "contact_form", action: "create"
  
end
