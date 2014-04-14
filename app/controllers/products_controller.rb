class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :edit_product_images]
  protect_from_forgery except: [:create, :update]

  # GET /products
  # GET /products.json
  def index
    if params[:tag]
      @tags = params[:tag].split("/")
      @products = Product.tagged_with(@tags).page(params[:page]).per(12)
      @search = Product.search(params[:q])
    else
      @search = Product.search(params[:q])
      @products = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(12)
    end
    
  end

  def index_with_tag
    @products = Product.where(tag_list: params[:tag])
    render "index"
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @search = Product.search(params[:q])
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
    render "edit_product_images", layout: false
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
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(
        :id,
        :name,
        :is_published,
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
          :value
        ]
      )
    end
end
