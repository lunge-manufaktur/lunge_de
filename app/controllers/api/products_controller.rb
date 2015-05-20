module Api
  class ProductsController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_action :current_user
    after_action :verify_authorized
    respond_to :json

    # GET /products
    def index
      if current_user.admin?
        @products = Product.all.includes(:size, :stocks, :brand, :stores, :product_images)
      else
        @products = Product.published.includes(:size, :stocks, :brand, :stores, :product_images)
      end

      authorize @products
    end

    # GET /products/1
    def show
      if current_user.admin?
        @product = Product.includes(:size, :stocks, :brand, :stores, :product_images).find(params[:id])
      else
        @products = Product.published.includes(:size, :stocks, :brand, :stores, :product_images).find(params[:id])
      end
      
      authorize @product
    end

    # POST /products
    def create
      @product = Product.new(product_params)
      authorize @product
      if @product.save
        render nothing: true, status: :created
      end
    end

    # PATCH/PUT /products/1
    def update
      @product = Product.find(params[:id])
      authorize @product
      respond_with @product.update(product_params)
    end

    # DELETE /products/1
    def destroy
      @product = Product.find(params[:id])
      authorize @product
      respond_with @product.destroy
    end





    private

    def current_user
      authenticate_or_request_with_http_token do |token, options|
        key = ApiKey.find_by_key(token)
        user = key.user if key
      end
    end

    def product_params
      params.require(:product).permit(
        :id,
        :name,
        :sku,
        :description,
        :updated_at,
        :size_id,
        :brand_id,
        :regular_price,
        :current_price,
        :color,
        :is_published,
        :official_description,
        :is_on_sale,
        :is_on_frontpage,
        :is_featured,
        :tag_list,
        stocks_attributes: [
          :id,
          :product_id,
          :store_id,
          :g1,
          :g1h,
          :g2,
          :g2h,
          :g3,
          :g3h,
          :g4,
          :g4h,
          :g5,
          :g5h,
          :g6,
          :g6h,
          :g7,
          :g7h,
          :g8,
          :g8h,
          :g9,
          :g9h,
          :g10,
          :g10h,
          :g11,
          :g11h,
          :g12,
          :g12h,
          :g13,
          :g13h,
          :g14,
          :g14h,
          :g15,
          :g16,
          :g17,
          :g18,
          :g19
        ],
        product_images_attributes: [
          :id,
          :product_id,
          :image,
          :default,
          :_destroy
        ],
        properties_attributes: [
          :id,
          :product_id,
          :name,
          :value
        ]
      )
    end

  end
end
