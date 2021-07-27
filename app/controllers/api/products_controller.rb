module Api
  class ProductsController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_action :current_user
    after_action :verify_authorized
    respond_to :json

    # GET /products
    def index
      @products = Product.all.includes(:size, :stocks, :brand, :stores, :product_images, :tags)
      @products = @products.where(is_published: params[:published]) unless params[:published].blank?
      @products = @products.where(is_on_frontpage: params[:highlight]) unless params[:highlight].blank?
      @products = @products.where(is_featured: params[:featured]) unless params[:featured].blank?
      @products = params[:order] = "bestselling" ? @products.best_selling : @products.newest
      @products = @products.page(params[:page]).per(100).limit(params[:limit])

      authorize @products
    end

    def changed_since
      date = params[:date].to_datetime
      @products = Product.where("updated_at >= ?", date).includes(:size, :stocks, :brand, :stores, :product_images, :tags).page(params[:page]).per(100)
      authorize @products
      render "index"
    end

    def stock_changed_since
      date = params[:date].to_datetime
      @products = Product.joins(:stocks).where("stocks.updated_at >= ?", date).includes(:size, :stocks, :brand, :stores, :product_images, :tags).page(params[:page]).per(100)
      authorize @products
      render "index"
    end

    # GET /products/1
    def show
      @product = Product.includes(:size, :stocks, :brand, :stores, :product_images, :tags).find(params[:id])
      authorize @product
    end

    # POST /products
    def create
      @product = Product.new(product_params)
      authorize @product
      if @product.save
        render json: @product, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    def update
      @product = Product.find(params[:id])
      authorize @product
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
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
        :created_at,
        :updated_at,
        :published_at,
        :size_id,
        :brand_id,
        :regular_price,
        :current_price,
        :current_price_without_tax_reduction,
        :color,
        :is_published,
        :orderable,
        :official_description,
        :is_on_sale,
        :is_on_frontpage,
        :is_featured,
        :use_in_lia_campaign,
        :sales_over_90_days,
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
