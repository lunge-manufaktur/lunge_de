module Api
  class ProductsController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_filter :restrict_access
    respond_to :json

    # GET /products
    def index
      respond_with @products = Product.all
    end

    # GET /products/1
    def show
      respond_with @product = Product.find(params[:id])
    end

    # POST /products
    def create
      respond_with Product.create(product_params)
    end

    # PATCH/PUT /products/1
    def update
      respond_with Product.update(params[:id], product_params)
    end

    # DELETE /products/1
    def destroy
      respond_with Product.destroy(params[:id])
    end



    private

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(key: token)
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
