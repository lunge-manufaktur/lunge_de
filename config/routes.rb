Rails.application.routes.draw do

  devise_for :users
  root :to => "pages#home"

  # sitemap
  get "sitemap", controller: "sitemaps", action: "show", format: "xml"
  post "payment", controller: "pages", action: "payment", format: "json"

  # error pages
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"

  # concerns
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, :as => ''
    match 'search/page/:page', action: :search, on: :collection, via: [:get, :post], as: :search_page
  end

  concern :searchable do
    match 'search', action: :search, on: :collection, via: [:get, :post], as: :search
  end

  # /api/...
  namespace :api, defaults: {format: 'json'} do
    resources :brands
    resources :employees
    resources :events
    resources :products, concerns: [:paginatable] do
      collection do
        get "changed_since/:date", action: "changed_since", as: "recently_changed"
        get "changed_since/:date/page/:page", action: "changed_since"
        get "stock_changed_since/:date", action: "stock_changed_since", as: "recently_changed_stock"
        get "stock_changed_since/:date/page/:page", action: "stock_changed_since"
      end
    end
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
  resources :categories, except: "index"
  resources :events
  resources :posts, concerns: [ :searchable ]
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
      get "tags/:tags", action: "index", as: :tag
      get '/tags/:tags/search', action: :search, as: :tagged_search
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
  get "gutschein", controller: "pages", action: "gutschein"
  get "jobs", controller: "pages", action: "jobs"
  get "privacy_policy", controller: "pages", action: "privacy_policy"
  get "docs/api", controller: "pages", action: "api_docs"
  
end
