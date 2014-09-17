LungeDe::Application.routes.draw do

  devise_for :users
  root :to => "home#index"

  # error pages
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"

  # concerns
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, :as => ''
    get '(search/page/:page)', action: :search, on: :collection, :as => 'search_page'
  end

  concern :searchable do
    match '(search)', action: :search, on: :collection, via: [:get, :post], as: :search
  end

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

  # /admin/...
  namespace :admin do
    resources :events
  end

  # /...
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
  resources :products, concerns: [:paginatable, :searchable] do
    get "featured" => "products#show_featured", :as => "featured"
    collection do
      
      get "tags/:tags", to: "products#index", as: :tag
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
