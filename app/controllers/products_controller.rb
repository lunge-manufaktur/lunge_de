class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :destroy, :edit_product_images, :edit_properties, :save_properties]
  before_action :authenticate_user!, only: [:new, :create, :edit, :edit_product_images, :edit_properties, :destroy], unless: :valid_api_key?
  protect_from_forgery except: [:create, :update]

  # GET /products
  # GET /products.json
  def index
    if params[:tags]
      @tags = params[:tags].split('+').map { |tag| tag.gsub('-', '/') }
      @search = Product.published.tagged_with(@tags).search(params[:q])
      @products = @search.result
                         .includes(:brand, :product_images, :tags)
                         .prefer_with_image.newest
                         .page(params[:page]).per(12)
    else
      @search = Product.published.search(params[:q])
      @products = @search.result
                         .includes(:brand, :product_images, :tags)
                         .prefer_with_image.newest
                         .page(params[:page]).per(12)
    end
  end


  def search
    index
    render 'index'
  end

  def remove_tag
    @original_tags = params[:tags]
    @tags = @original_tags.delete(params[:to_remove])
    render action: index
  end

  def index_with_tag
    @products = Product.published.where(tag_list: params[:tag])
    render 'index'
  end

  # GET /products/1
  # GET /products/1.json
  def show
    authorize @product
    @search = Product
              .includes(:brand, :product_images, :stocks, :sizes)
              .search(params[:q])
    @related_products = @product.find_related_tags.published.limit(6)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # GET /products/1/edit_product_images
  def edit_product_images
    render 'edit_product_images', layout: false
  end

  # GET /products/1/edit_properties
  def edit_properties
    render 'edit_properties', layout: false
  end

  def save_properties
    @product.update(product_params)
    redirect_to edit_properties_product_path(@product)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

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

    respond_to do |format|
      if @product.update(product_params)
        format.html do
          if params[:product][:stay_on_page] == '1'
            render action: 'edit_product_images', layout: false
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
      :name,
      :is_published,
      :is_featured,
      :is_on_frontpage,
      :use_in_lia_campaign,
      :sku,
      :description,
      :brand_id,
      :size_id,
      :current_price,
      :regular_price,
      :color,
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
        :value,
        :_destroy
      ]
    )
  end
end
