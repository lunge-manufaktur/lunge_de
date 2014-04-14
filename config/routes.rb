LungeDe::Application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    # /api/...

    resources :properties

    resources :stocks

    resources :stores

    resources :brands

    resources :sizes

    resources :products

    resources :product_categories

    resources :product_categorizations

  end

  

  resources :categorizations

  resources :categories

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

    get 'page/:page', :action => :index, :on => :collection
    get "featured" => "products#show_featured", :as => "featured"

    collection do
      get "/tags/*tag", to: "products#index", as: :tag
    end

    resources :product_images

    member do
      get :edit_product_images
    end

  end

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
  
end
