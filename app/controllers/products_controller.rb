class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :destroy, :edit_product_images, :edit_properties, :save_properties]
  before_action :authenticate_user!, only: [:new, :create, :edit, :edit_product_images, :edit_properties, :destroy], unless: :valid_api_key?
  protect_from_forgery except: [:create, :update]

  # GET /products
  # GET /products.json
  def index
    # search param to array
    if params[:q].present?
      params[:q][:name_or_sku_or_brand_name_cont_any] = params[:q][:name_or_sku_or_brand_name_cont_any]&.split
    end

    if params[:tags].present?
      @tags = params[:tags]&.gsub('-', ' ').split('+')
    end
    
    if @tags.present?
      @search = policy_scope(Product).includes(:brand, :stocks, :size, :product_images, :default_product_images, :tags, :taggings).tagged_with(@tags).ransack(params[:q])
    else
      @search = policy_scope(Product).includes(:brand, :stocks, :size, :product_images, :default_product_images, :tags, :taggings).ransack(params[:q])
    end

    @products = @search.result(distinct: true)
                       .prefer_featured.newest
                       .page(params[:page]).per(12)

    # search param to string
    if params[:q].present?
      params[:q][:name_or_sku_or_brand_name_cont_any] = params[:q][:name_or_sku_or_brand_name_cont_any]&.join(" ")
    end
  end

  def search
    index
    render 'index'
  end

  def index_with_tag
    @products = Product.published.newest.where(tag_list: params[:tag])
    render 'index'
  end

  def index_on_sale
    @search = policy_scope(Product).includes(:brand, :stocks, :size, :product_images, :default_product_images, :tags, :taggings).ransack(params[:q])

    @products = @search.result(distinct: true)
                       .on_sale
                       .prefer_featured.newest
                       .page(params[:page]).per(12)
    render "index"
  end

  # GET /products/1
  # GET /products/1.json
  def show
    authorize @product
    @related_products = @product.find_related_tags.published.limit(6)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    authorize @product
  end

  # GET /products/1/edit_product_images
  def edit_product_images
    authorize @product
    render 'edit_product_images', layout: false
  end

  # GET /products/1/edit_properties
  def edit_properties
    authorize @product
    render 'edit_properties', layout: false
  end

  def save_properties
    authorize @product
    @product.update(product_params)
    redirect_to edit_properties_product_path(@product)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    authorize @product

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.friendly.find(params[:id])
    authorize @product

    respond_to do |format|
      if @product.update(product_params)
        format.html do
          if params[:product][:stay_on_page] == '1'
            redirect_to action: 'edit_product_images', layout: false
          else
            redirect_to @product, notice: 'Product was successfully updated.'
          end  
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    authorize @product

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    if current_user || valid_api_key?
      @product = Product.friendly.find(params[:id])
    else
      @product = Product.published.friendly.find(params[:id])
    end
  end

  def valid_api_key?
    ApiKey.exists?(key: params[:api_key])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(
      :brand_id,
      :color,
      :current_price,
      :current_price_without_tax_reduction,
      :description,
      :is_archived,
      :is_exclusive,
      :is_featured,
      :is_on_frontpage,
      :is_on_supersale,
      :is_published,
      :meta_description,
      :name,
      :orderable,
      :published_at,
      :regular_price,
      :size_id,
      :sku,
      :tag_list,
      :use_in_lia_campaign,
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
        :value,
        :_destroy
      ]
    )
  end
end
